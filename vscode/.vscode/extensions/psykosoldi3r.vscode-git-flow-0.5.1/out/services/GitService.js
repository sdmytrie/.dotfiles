"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const child_process_1 = require("child_process");
class GitService {
    constructor(cwd, outputChannel) {
        this._cwd = cwd;
        this._outputChannel = outputChannel;
    }
    exec(command, showErrorMessage = true) {
        try {
            this._outputChannel.appendLine(command);
            const output = child_process_1.execSync(command, {
                cwd: this._cwd
            });
            if (output) {
                this._outputChannel.appendLine(output.toString());
                return output.toString().trim();
            }
        }
        catch (ex) {
            if (showErrorMessage && ex && ex.message) {
                this._outputChannel.appendLine(`Error: ${ex.message}`);
                vscode.window.showErrorMessage(ex.message);
            }
            return "";
        }
        return "";
    }
    getConfig(key) {
        return this.exec(`git config ${key}`, false);
    }
    get flowConfig() {
        var _a, _b, _c, _d, _e, _f, _g;
        return {
            "branches": {
                "master": (_a = this.getConfig("gitflow.branch.master")) !== null && _a !== void 0 ? _a : undefined,
                "develop": (_b = this.getConfig("gitflow.branch.develop")) !== null && _b !== void 0 ? _b : undefined
            },
            "prefixes": {
                "feature": (_c = this.getConfig("gitflow.prefix.feature")) !== null && _c !== void 0 ? _c : undefined,
                "release": (_d = this.getConfig("gitflow.prefix.release")) !== null && _d !== void 0 ? _d : undefined,
                "hotfix": (_e = this.getConfig("gitflow.prefix.hotfix")) !== null && _e !== void 0 ? _e : undefined,
                "support": (_f = this.getConfig("gitflow.prefix.support")) !== null && _f !== void 0 ? _f : undefined,
                "versiontag": (_g = this.getConfig("gitflow.prefix.versiontag")) !== null && _g !== void 0 ? _g : undefined
            }
        };
    }
    get branches() {
        const output = this.exec("git branch --all");
        const rawBranches = output.split(`\n`);
        return rawBranches.map((branch) => {
            branch = branch.replace(/[*]/gm, "");
            branch = branch.trim();
            return branch;
        });
    }
    get activeBranch() {
        const output = this.exec("git branch");
        const branches = output.split("\n");
        const activeBranch = branches.find((branch) => branch.startsWith("*"));
        return (activeBranch === null || activeBranch === void 0 ? void 0 : activeBranch.replace("*", "").trim()) || "";
    }
    checkout(branch) {
        return this.exec(`git checkout ${branch}`);
    }
    flowStart(prefix, branch) {
        return this.exec(`git flow ${prefix} start ${branch}`);
    }
    flowTrack(prefix, branch) {
        return this.exec(`git flow ${prefix} track ${branch}`);
    }
    flowFinish(prefix, branch) {
        if (prefix === "release") {
            vscode.window.showInputBox({
                placeHolder: "Enter tag message"
            }).then((tagMessage) => {
                child_process_1.execSync("", {
                    input: tagMessage,
                });
            });
        }
        return this.exec(`git flow ${prefix} finish ${branch}`);
    }
    delete(branch, isRemote = false) {
        if (isRemote) {
            const remoteBranch = branch.replace("remotes/origin/", "");
            return this.exec(`git push origin --delete ${remoteBranch}`);
        }
        else {
            return this.exec(`git branch -d ${branch}`);
        }
    }
    pull(branch) {
        const currentBranch = this.activeBranch;
        console.log(currentBranch);
        this.exec(`git checkout ${branch}`);
        this.exec(`git pull`);
        this.exec(`git checkout ${currentBranch}`);
    }
    mergeBranch(branchToMerge, prefix, branchName, isRemote) {
        this.exec(`git pull origin ${branchToMerge}`);
        if (isRemote) {
            this.flowTrack(prefix, branchName);
        }
        else {
            this.checkout(`${prefix}/${branchName}`);
        }
        this.exec(`git merge ${branchToMerge}`);
    }
    get isInitialized() {
        const { master, develop } = this.flowConfig.branches;
        return (master !== undefined &&
            develop !== undefined);
    }
}
const service = new GitService(vscode.workspace.rootPath || "", vscode.window.createOutputChannel("Git Flow"));
exports.default = service;
//# sourceMappingURL=GitService.js.map