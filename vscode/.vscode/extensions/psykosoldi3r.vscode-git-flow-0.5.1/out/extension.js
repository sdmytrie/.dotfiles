"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const vscode = require("vscode");
const MainTreeViewProvider_1 = require("./treeviews/MainTreeViewProvider");
const BranchTreeViewProvider_1 = require("./treeviews/BranchTreeViewProvider");
const BranchTreeItem_1 = require("./treeviews/BranchTreeItem");
const GitService_1 = require("./services/GitService");
function activate(context) {
    const mainTreeViewProvider = new MainTreeViewProvider_1.MainTreeViewProvider();
    vscode.window.registerTreeDataProvider("gitflow.views.main", mainTreeViewProvider);
    const featureTreeViewProvider = new BranchTreeViewProvider_1.BranchTreeViewProvider("feature");
    vscode.window.registerTreeDataProvider("gitflow.views.feature", featureTreeViewProvider);
    const releaseTreeViewProvider = new BranchTreeViewProvider_1.BranchTreeViewProvider("release");
    vscode.window.registerTreeDataProvider("gitflow.views.release", releaseTreeViewProvider);
    vscode.commands.registerCommand("gitflow.init", () => {
        console.log("Init");
    });
    vscode.commands.registerCommand("gitflow.refresh", () => {
        mainTreeViewProvider.refresh();
        featureTreeViewProvider.refresh();
        releaseTreeViewProvider.refresh();
    });
    vscode.commands.registerCommand("gitflow.checkout", (item) => {
        if (item instanceof BranchTreeItem_1.default) {
            if (item.isRemote) {
                GitService_1.default.flowTrack(item.prefix, item.branchName);
            }
            else {
                GitService_1.default.checkout(item.branch);
            }
            return vscode.commands.executeCommand("gitflow.refresh");
        }
    });
    vscode.commands.registerCommand("gitflow.feature.start", () => {
        vscode.window.showInputBox({
            placeHolder: "Enter a name to create feature branch"
        }).then((branch) => {
            if (branch) {
                GitService_1.default.flowStart("feature", branch);
                vscode.commands.executeCommand("gitflow.refresh");
            }
        });
    });
    vscode.commands.registerCommand("gitflow.release.start", () => {
        vscode.window.showInputBox({
            placeHolder: "Enter a name to create release branch"
        }).then((branch) => {
            if (branch) {
                GitService_1.default.flowStart("release", branch);
                vscode.commands.executeCommand("gitflow.refresh");
            }
        });
    });
    vscode.commands.registerCommand("gitflow.finish", (item) => {
        if (item instanceof BranchTreeItem_1.default && item.prefix === "feature") {
            GitService_1.default.flowFinish(item.prefix, item.branchName);
            vscode.commands.executeCommand("gitflow.refresh");
        }
    });
    vscode.commands.registerCommand("gitflow.branch.delete", (item) => {
        if (item instanceof BranchTreeItem_1.default) {
            GitService_1.default.delete(item.branch, item.isRemote);
            return vscode.commands.executeCommand("gitflow.refresh");
        }
    });
    vscode.commands.registerCommand("gitflow.branch.pull", (item) => {
        if (item instanceof BranchTreeItem_1.default) {
            GitService_1.default.pull(item.branch);
            return vscode.commands.executeCommand("gitflow.refresh");
        }
    });
    vscode.commands.registerCommand("gitflow.views.feature.filterRemotes", () => {
        const configuration = vscode.workspace.getConfiguration("gitflow");
        const showRemoteBranches = configuration.get("views.feature.showRemoteBranches", true);
        configuration.update("views.feature.showRemoteBranches", !showRemoteBranches, vscode.ConfigurationTarget.Global)
            .then(() => {
            vscode.commands.executeCommand("gitflow.refresh");
        });
    });
    vscode.commands.registerCommand("gitflow.merge.develop.feature", (item) => {
        if (item instanceof BranchTreeItem_1.default) {
            GitService_1.default.mergeBranch(GitService_1.default.flowConfig.branches.develop || "", item.prefix, item.branchName, item.isRemote);
            vscode.commands.executeCommand("gitflow.refresh");
        }
    });
    vscode.commands.executeCommand("setContext", "gitflow.initialized", GitService_1.default.isInitialized);
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map