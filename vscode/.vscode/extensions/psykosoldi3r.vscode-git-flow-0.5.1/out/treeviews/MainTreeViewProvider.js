"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MainTreeViewProvider = void 0;
const vscode = require("vscode");
const child_process_1 = require("child_process");
const BranchTreeItem_1 = require("./BranchTreeItem");
const GitService_1 = require("../services/GitService");
class MainTreeViewProvider {
    constructor() {
        this._onDidChangeTreeData = new vscode.EventEmitter();
        this.onDidChangeTreeData = this._onDidChangeTreeData.event;
    }
    getTreeItem(element) {
        return element;
    }
    getChildren(element) {
        const master = child_process_1.execSync("git config gitflow.branch.master", {
            cwd: vscode.workspace.rootPath
        }).toString().trim();
        const develop = child_process_1.execSync("git config gitflow.branch.develop", {
            cwd: vscode.workspace.rootPath
        }).toString().trim();
        const masterBranch = new BranchTreeItem_1.default(master, GitService_1.default.activeBranch === master);
        const developBranch = new BranchTreeItem_1.default(develop, GitService_1.default.activeBranch === develop);
        return Promise.resolve([masterBranch, developBranch]);
    }
    refresh() {
        this._onDidChangeTreeData.fire(undefined);
    }
}
exports.MainTreeViewProvider = MainTreeViewProvider;
//# sourceMappingURL=MainTreeViewProvider.js.map