/*
 * 08/28/2012
 *
 * WorkspaceTree.java - A tree representation of a workspace.
 * Copyright (C) 2012 Robert Futrell
 * http://fifesoft.com/rtext
 * Licensed under a modified BSD license.
 * See the included license file for details.
 */
package org.fife.rtext.plugins.project.tree;

import java.awt.Cursor;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.ActionMap;
import javax.swing.BorderFactory;
import javax.swing.InputMap;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.JTree;
import javax.swing.KeyStroke;
import javax.swing.UIManager;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.ExpandVetoException;
import javax.swing.tree.TreePath;

import org.fife.rtext.AbstractMainView;
import org.fife.rtext.plugins.project.ProjectPlugin;
import org.fife.rtext.plugins.project.model.Workspace;
import org.fife.ui.rtextfilechooser.FileSelector;


/**
 * A tree view of a workspace and its projects.
 *
 * @author Robert Futrell
 * @version 1.0
 */
public class WorkspaceTree extends JTree implements FileSelector {

	private ProjectPlugin plugin;
	private DefaultTreeModel model;
	private DefaultMutableTreeNode root;
	private JPopupMenu popup;


	public WorkspaceTree(ProjectPlugin plugin, Workspace workspace) {

		this.plugin = plugin;
		root = new WorkspaceRootTreeNode(plugin, workspace);
		model = new DefaultTreeModel(root);
		installActions();
		setModel(model);
		setWorkspace(workspace);
		setCellRenderer(new WorkspaceTreeRenderer());

		// Add a needed extra bit of space at the top.
		setBorder(BorderFactory.createCompoundBorder(
				BorderFactory.createEmptyBorder(3, 3, 0, 3),
				getBorder()));

	}


	private void configurePopupMenu() {

		if (popup==null) {
			popup = new JPopupMenu();
		}
		else {
			popup.removeAll();
		}

		Object node = getSelectionPath().getLastPathComponent();
		if (node!=null) {
			AbstractWorkspaceTreeNode treeNode =
					(AbstractWorkspaceTreeNode)node;
			List actions = treeNode.getPopupActions();
			for (Iterator i=actions.iterator(); i.hasNext(); ) {
				Object obj = i.next();
				if (obj instanceof JMenu) {
					popup.add((JMenu)obj);
				}
				else {
					Action action = (Action)obj;
					if (action==null) {
						popup.addSeparator();
					}
					else {
						popup.add(new JMenuItem(action));
					}
				}
			}
		}

	}


	/**
	 * Displays the popup menu at the specified location.
	 *
	 * @param p The location at which to display the popup.
	 */
	private void displayPopupMenu(Point p) {

		// Select the tree node at the mouse position.
		TreePath path = getPathForLocation(p.x, p.y);
		if (path!=null) {
			setSelectionPath(path);
			scrollPathToVisible(path);
		}
		else {
			clearSelection();
			return;
		}

		// Configure and display it!
		configurePopupMenu();
		if (popup.getComponentCount()!=0) {
			popup.show(this, p.x, p.y);
		}

	}


	/**
	 * Called when a node is about to be expanded.  This method is overridden
	 * so that the node that is being expanded will be populated with its
	 * subdirectories, if necessary.
	 */
	public void fireTreeWillExpand(TreePath e) throws ExpandVetoException {

		super.fireTreeWillExpand(e);

		AbstractWorkspaceTreeNode awtn =
					(AbstractWorkspaceTreeNode)e.getLastPathComponent();

		// If the only child is the dummy one, we know we haven't populated
		// this node with true children yet.
		if (awtn instanceof PhysicalLocationTreeNode) {
			PhysicalLocationTreeNode pltn = (PhysicalLocationTreeNode)awtn;
			if (pltn.isNotPopulated()) {
				Cursor orig = getCursor();
				setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
				try {
					refreshChildren(pltn);
				} finally {
					setCursor(orig);
				}
			}
		}

	}


	/**
	 * Returns the file currently selected by the user.
	 *
	 * @return The file currently selected, or <code>null</code>
	 *         if no file is selected.
	 * @see #getSelectedFiles()
	 */
	public File getSelectedFile() {
		TreePath path = getSelectionPath();
		if (path!=null) {
			Object comp = path.getLastPathComponent();
			if (comp instanceof FileTreeNode) {
				FileTreeNode node = (FileTreeNode)comp;
				return node.getFile();
			}
			else if (comp instanceof FileProjectEntryTreeNode) {
				FileProjectEntryTreeNode node = (FileProjectEntryTreeNode)comp;
				return node.getFile();
			}
		}
		return null;
	}


	/**
	 * Returns any selected files.
	 *
	 * @return The selected files, or a zero-length array if no files are
	 *         selected.
	 */
	public File[] getSelectedFiles() {
		File file = getSelectedFile();
		if (file!=null) {
			return new File[] { file };
		}
		return new File[0];
	}


	/**
	 * Opens the selected file in RText, if any.
	 */
	private void handleOpenFile() {
		File file = getSelectedFile();
		if (file!=null) {
			// We'll make sure the file exists and is a regular file
			// (as opposed to a directory) before attempting to open it.
			if (file.isFile()) {
				AbstractMainView mainView = plugin.getRText().getMainView();
				mainView.openFile(file.getAbsolutePath(), null);
			}
		}
	}


	/**
	 * Adds wrapper actions to the tree item-specific actions, so users can
	 * use keyboard shortcuts to activate them.
	 */
	private void installActions() {

		InputMap im = getInputMap();
		ActionMap am = getActionMap();

		im.put(KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0), "Rename");
		am.put("Rename", new AbstractAction() {
			public void actionPerformed(ActionEvent e) {
				Object selected = getLastSelectedPathComponent();
				if (selected instanceof AbstractWorkspaceTreeNode) {
					((AbstractWorkspaceTreeNode)selected).handleRename();
				}
			}
		});

		im.put(KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0), "Refresh");
		am.put("Refresh", new AbstractAction() {
			public void actionPerformed(ActionEvent e) {
				Object selected = getLastSelectedPathComponent();
				if (selected instanceof PhysicalLocationTreeNode) {
					refreshChildren((PhysicalLocationTreeNode)selected);
				}
			}
		});

		im.put(KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0), "Enter");
		am.put("Enter", new AbstractAction() {
			public void actionPerformed(ActionEvent e) {
				File file = null;
				Object selected = getLastSelectedPathComponent();
				if (selected instanceof FileProjectEntryTreeNode) {
					file = ((FileProjectEntryTreeNode)selected).getFile();
				}
				else if (selected instanceof FileTreeNode) {
					file = ((FileTreeNode)selected).getFile();
				}
				if (file.isFile()) {
					plugin.getRText().openFile(file.getAbsolutePath());
				}
				else {
					UIManager.getLookAndFeel().provideErrorFeedback(null);
				}
			}
		});

		int alt = InputEvent.ALT_MASK;
		im.put(KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, alt), "Properties");
		am.put("Properties", new AbstractAction() {
			public void actionPerformed(ActionEvent e) {
				Object selected = getLastSelectedPathComponent();
				if (selected instanceof AbstractWorkspaceTreeNode) {
					((AbstractWorkspaceTreeNode)selected).handleProperties();
				}
			}
		});

	}


	/**
	 * Overridden to display our popup menu if necessary.
	 *
	 * @param e The mouse event.
	 */
	protected void processMouseEvent(MouseEvent e) {
		super.processMouseEvent(e);
		if (e.isPopupTrigger()) {
			displayPopupMenu(e.getPoint());
		}
		else if (e.getID()==MouseEvent.MOUSE_CLICKED && e.getClickCount()==2) {
			handleOpenFile();
		}
	}


	/**
	 * Refreshes the children of the specified node (representing a directory)
	 * to accurately reflect the files inside of it.
	 *
	 * @param node The node whose children should be refreshed.
	 */
	void refreshChildren(PhysicalLocationTreeNode node) {

		if (node instanceof PhysicalLocationTreeNode) {
			node.refreshChildren();
			model.reload(node);
		}

	}


	public void setWorkspace(Workspace workspace) {
		WorkspaceTreeRootCreator creator = new WorkspaceTreeRootCreator(plugin);
		workspace.accept(creator);
		model.setRoot(creator.getRoot());
	}


}