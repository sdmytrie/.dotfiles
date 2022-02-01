"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BranchTreeViewProvider = void 0;
const vscode = require("vscode");
const GitService_1 = require("../services/GitService");
const BranchTreeItem_1 = require("./BranchTreeItem");
class BranchTreeViewProvider {
    constructor(prefix) {
        this._onDidChangeTreeData = new vscode.EventEmitter();
        this.onDidChangeTreeData = this._onDidChangeTreeData.event;
        this._prefix = prefix;
    }
    getTreeItem(element) {
        return element;
    }
    getChildren(element) {
        var _a, _b;
        const activeBranch = GitService_1.default.activeBranch;
        const filter = vscode.workspace.getConfiguration("gitflow").get("views.feature.showRemoteBranches");
        const configPrefix = ((_b = (_a = GitService_1.default === null || GitService_1.default === void 0 ? void 0 : GitService_1.default.flowConfig) === null || _a === void 0 ? void 0 : _a.prefixes) === null || _b === void 0 ? void 0 : _b[this._prefix]) || this._prefix;
        const branches = GitService_1.default.branches.filter((branch) => {
            if (filter === true) {
                console.log(configPrefix);
                return (branch.startsWith(configPrefix) || branch.startsWith(`remotes/origin/${this._prefix}/`));
            }
            return branch.startsWith(configPrefix);
        });
        return Promise.resolve(branches.map((branch) => {
            const isRemote = branch.startsWith(`remotes/origin/${this._prefix}/`);
            return new BranchTreeItem_1.default(branch, branch === activeBranch, this._prefix, isRemote);
        }));
    }
    refresh() {
        this._onDidChangeTreeData.fire(undefined);
    }
}
exports.BranchTreeViewProvider = BranchTreeViewProvider;
//# sourceMappingURL=BranchTreeViewProvider.js.map