"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class Branch extends vscode.TreeItem {
    constructor(branch, active, prefix = "", isRemote = false) {
        super(branch, vscode.TreeItemCollapsibleState.None);
        this.active = active;
        this.isRemote = isRemote;
        this.iconPath = new vscode.ThemeIcon(this.isRemote === true ? "git-branch" : this.active === true ? "circle-filled" : "circle-outline");
        this._branch = branch;
        this._prefix = prefix;
        this.label = (this.isRemote ? this._branch.replace(`remotes/origin/${this._prefix}/`, "") : this._branch.replace(`${this._prefix}/`, ""));
        this.tooltip = `${this._branch} (${this.isRemote === true ? "remote" : "local"})`;
        this.description = this.active === true ? "active" : "";
    }
    get branch() {
        return this._branch;
    }
    get branchName() {
        return this.label || "";
    }
    get prefix() {
        return this._prefix;
    }
}
exports.default = Branch;
//# sourceMappingURL=BranchTreeItem.js.map