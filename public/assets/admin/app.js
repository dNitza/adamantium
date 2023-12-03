(() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key) && key !== except)
          __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
    }
    return to;
  };
  var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
    // If the importer is in node compatibility mode or this is not an ESM
    // file that has been converted to a CommonJS file using a Babel-
    // compatible transform (i.e. "__esModule" has not been set), then set
    // "default" to the CommonJS "module.exports" for node compatibility.
    isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
    mod
  ));

  // node_modules/tiny-markdown-editor/lib/svg/svg.js
  var require_svg = __commonJS({
    "node_modules/tiny-markdown-editor/lib/svg/svg.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", {
        value: true
      });
      exports.default = void 0;
      var svg = {
        blockquote: `<svg height="18" width="18"><rect width="5" height="5" x="3" y="4" ry="1"/><rect ry="1" y="4" x="10" height="5" width="5"/><path d="M8 6.999v3c0 1-1 3-1 3s-.331 1-1.331 1h-1c-1 0-.669-1-.669-1s1-2 1-3v-3zm7 0v3c0 1-1 3-1 3s-.331 1-1.331 1h-1c-1 0-.669-1-.669-1s1-2 1-3v-3z"/></svg>`,
        bold: `<svg height="18" width="18"><path d="M4 2a1 1 0 00-1 1v12a1 1 0 001 1h6c4 0 5-2 5-4 0-1.322-.434-2.636-1.885-3.381C13.772 7.885 14 6.945 14 6c0-2-1-4-5-4zm1 2h4c1.668 0 2.32.393 2.6.672.28.279.4.662.4 1.328s-.12 1.057-.4 1.338c-.275.274-1.014.646-2.6.662H5zm5 6c1.666.005 2.318.388 2.596.666.277.278.404.667.404 1.334s-.127 1.06-.404 1.338c-.278.278-.93.66-2.596.662l-4.992.004L5 10z"/></svg>`,
        clear_formatting: `<svg height="18" width="18"><path d="M11.03 1a1 1 0 00-.74.3l-9 9a1 1 0 000 1.4l4 4A1 1 0 006 16h2a1 1 0 00.7-.3l8-8a1 1 0 000-1.4l-5-5a1 1 0 00-.67-.3zM8.7 5.7l3.58 3.6L7.6 14H6.4l-3-3 5.3-5.3z"/><rect ry=".8" rx=".8" y="14" x="16" height="2" width="2"/><rect width="2" height="2" x="13" y="14" rx=".8" ry=".8"/><rect ry=".8" rx=".8" y="14" x="10" height="2" width="2"/></svg>`,
        code: `<svg height="18" width="18"><path d="M13.5 2.994a.5.5 0 00-.5.5.5.5 0 000 .034V4.53a5.993 5.993 0 00-7.451-.445A6 6 0 1012.45 13.9a5.99 5.99 0 001.346-1.334.5.5 0 00.096-.101.5.5 0 00-.12-.698.5.5 0 00-.697.12l-.004-.005a5 5 0 01-1.197 1.2 5 5 0 111.215-6.965.5.5 0 00.697.12.5.5 0 00.211-.44V4.745H14V3.493a.5.5 0 00-.5-.5z"/></svg>`,
        h1: `<svg height="18" width="18"><path d="M3 2s0-1 1-1h1c1 0 1 1 1 1v6h6V2s0-1 1-1h1c1 0 1 1 1 1v14s0 1-1 1h-1c-1 0-1-1-1-1v-6H6v6s0 1-1 1H4c-1 0-1-1-1-1z"/></svg>`,
        h2: `<svg height="18" width="18"><path d="M4 2s0-1 1-1 1 1 1 1v6c1-1 2-1 4-1 3 0 4 2 4 4v5s0 1-1 1-1-1-1-1v-5c0-1.094-1-2-2-2-2 0-3 0-4 2v5s0 1-1 1-1-1-1-1z"/></svg>`,
        hr: `<svg height="18" width="18"><rect ry="1" y="8" height="2" width="18" style="font-variation-settings:normal;marker:none"/></svg>`,
        image: `<svg height="18" width="18"><path d="M1 2v14h16V2H1zm2 2h12v7l-3-3-4 4-2-2-3 3V4z"/><circle r="1.5" cy="6.5" cx="5.5"/></svg>`,
        italic: `<svg height="18" width="18"><path d="M9 2a1 1 0 000 2L7 14a1 1 0 100 2h2a1 1 0 000-2l2-10a1 1 0 100-2z"/></svg>`,
        link: `<svg height="18" width="18"><path d="M9.07 5.18a3.9 3.9 0 00-1.52.43C6.31 6.22 5.3 7.29 4.3 8.29c-1 1-2.07 2.02-2.68 3.26-.31.62-.5 1.33-.41 2.07.09.75.48 1.47 1.1 2.09.61.61 1.33 1 2.08 1.1.74.09 1.45-.1 2.07-.42 1.24-.61 2.26-1.68 3.26-2.68.46-.47.94-.94 1.39-1.44l-.43.26c-.68.34-1.49.56-2.36.46-.2-.03-.4-.08-.6-.14-.79.76-1.55 1.45-2.16 1.76-.38.19-.67.24-.92.21-.26-.03-.54-.14-.92-.53-.39-.38-.5-.66-.53-.91-.03-.26.02-.55.21-.93.39-.76 1.32-1.74 2.32-2.74 1-1 1.98-1.93 2.74-2.32.38-.19.67-.24.93-.21.25.03.53.14.91.53.39.38.5.66.53.92v.06l1.12-1.06.44-.47c-.18-.3-.4-.6-.67-.87-.62-.61-1.34-1-2.09-1.1a3.08 3.08 0 00-.55-.01z"/><path d="M13.07.86a3.9 3.9 0 00-1.52.43c-1.24.62-2.26 1.69-3.26 2.69-.46.47-.94.94-1.39 1.43.15-.08.28-.18.43-.25a4.4 4.4 0 012.36-.46c.2.02.4.07.6.14.79-.77 1.55-1.46 2.16-1.76.38-.19.67-.25.93-.21.25.03.53.14.91.52.39.38.5.66.53.92.03.26-.02.55-.21.93-.39.76-1.32 1.74-2.32 2.74-1 1-1.98 1.93-2.74 2.31-.38.2-.67.25-.93.22-.25-.04-.53-.15-.91-.53-.39-.38-.5-.66-.53-.92V9c-.36.33-.73.67-1.12 1.06l-.43.46c.17.3.4.6.66.87.62.62 1.34 1 2.08 1.1.75.1 1.46-.1 2.08-.41 1.24-.62 2.26-1.69 3.26-2.69s2.07-2.02 2.68-3.26c.31-.62.5-1.32.41-2.07a3.63 3.63 0 00-1.1-2.08c-.61-.62-1.33-1-2.07-1.1a3.08 3.08 0 00-.56-.02z"/></svg>`,
        ol: `<svg height="18" width="18"><path d="M1.5 7a.5.5 0 100 1h1a.5.5 0 01.5.5c0 .164-.08.31-.14.355l-1.655 1.25A.492.492 0 001 10.5a.5.5 0 00.5.5h2a.5.5 0 000-1H3l.398-.299A1.5 1.5 0 002.5 7z"/><path d="M1.5 12c-.667 0-.667 1 0 1h1.25c.333 0 .333.5 0 .5H2.5c-.667 0-.667 1 0 1h.25c.333 0 .333.5 0 .5H1.5c-.667 0-.667 1 0 1h1c.398 0 .78-.131 1.06-.365.282-.235.44-.554.44-.885a1.121 1.121 0 00-.303-.75c.191-.204.3-.47.303-.75 0-.332-.158-.651-.44-.885-.3-.241-.675-.37-1.06-.365z"/><rect y="13" x="6" height="2" width="12" ry="1"/><rect ry="1" width="12" height="2" x="6" y="8"/><rect y="3" x="6" height="2" width="12" ry="1"/><path d="M1.5 2a.5.5 0 100 1H2v2h-.5a.5.5 0 100 1h2a.5.5 0 100-1H3V2.5c0-.277-.223-.5-.5-.5z"/></svg>`,
        strikethrough: `<svg width="18" height="18"><path d="M10 2C6 2 4 4 4 6c0 .338.08.672.193 1h2.34C6.113 6.629 6 6.295 6 6c0-.334.117-.725.691-1.154C7.265 4.416 8.331 4 10 4h3a1 1 0 000-2zm1.477 9c.413.368.523.706.523 1 0 .334-.127.712-.701 1.143-.575.43-1.632.85-3.299.857l-1.006.007V14H5a1 1 0 000 2h3c4 0 6-2 6-4 0-.338-.081-.672-.195-1z"/><rect ry="1" y="8" x="1" height="2" width="16"/></svg>`,
        ul: `<svg height="18" width="18"><circle cx="2" cy="9" r="2"/><circle cy="4" cx="2" r="2"/><rect y="3" x="6" height="2" width="12" ry="1"/><circle cx="2" cy="14" r="2"/><rect ry="1" width="12" height="2" x="6" y="8"/><rect y="13" x="6" height="2" width="12" ry="1"/></svg>`
      };
      var _default = exports.default = svg;
    }
  });

  // node_modules/tiny-markdown-editor/lib/TinyMDECommandBar.js
  var require_TinyMDECommandBar = __commonJS({
    "node_modules/tiny-markdown-editor/lib/TinyMDECommandBar.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", {
        value: true
      });
      exports.default = void 0;
      var _svg = _interopRequireDefault(require_svg());
      function _interopRequireDefault(obj) {
        return obj && obj.__esModule ? obj : { default: obj };
      }
      var isMacLike = /(Mac|iPhone|iPod|iPad)/i.test(navigator.platform);
      var DefaultCommands = {
        "bold": {
          name: "bold",
          action: "bold",
          innerHTML: _svg.default.bold,
          title: "Bold",
          hotkey: "Mod-B"
        },
        "italic": {
          name: "italic",
          action: "italic",
          innerHTML: _svg.default.italic,
          title: "Italic",
          hotkey: "Mod-I"
        },
        "strikethrough": {
          name: "strikethrough",
          action: "strikethrough",
          innerHTML: _svg.default.strikethrough,
          title: "Strikethrough",
          hotkey: "Mod2-Shift-5"
        },
        "code": {
          name: "code",
          action: "code",
          innerHTML: _svg.default.code,
          title: "Format as code"
        },
        "h1": {
          name: "h1",
          action: "h1",
          innerHTML: _svg.default.h1,
          title: "Level 1 heading",
          hotkey: "Mod-Shift-1"
        },
        "h2": {
          name: "h2",
          action: "h2",
          innerHTML: _svg.default.h2,
          title: "Level 2 heading",
          hotkey: "Mod-Shift-2"
        },
        "ul": {
          name: "ul",
          action: "ul",
          innerHTML: _svg.default.ul,
          title: "Bulleted list"
        },
        "ol": {
          name: "ol",
          action: "ol",
          innerHTML: _svg.default.ol,
          title: "Numbered list"
        },
        "blockquote": {
          name: "blockquote",
          action: "blockquote",
          innerHTML: _svg.default.blockquote,
          title: "Quote",
          hotkey: "Mod2-Shift-Q"
        },
        "insertLink": {
          name: "insertLink",
          action: (editor) => {
            if (editor.isInlineFormattingAllowed())
              editor.wrapSelection("[", "]()");
          },
          enabled: (editor, focus, anchor) => editor.isInlineFormattingAllowed(focus, anchor) ? false : null,
          innerHTML: _svg.default.link,
          title: "Insert link",
          hotkey: "Mod-K"
        },
        "insertImage": {
          name: "insertImage",
          action: (editor) => {
            if (editor.isInlineFormattingAllowed())
              editor.wrapSelection("![", "]()");
          },
          enabled: (editor, focus, anchor) => editor.isInlineFormattingAllowed(focus, anchor) ? false : null,
          innerHTML: _svg.default.image,
          title: "Insert image",
          hotkey: "Mod2-Shift-I"
        },
        "hr": {
          name: "hr",
          action: (editor) => editor.paste("\n***\n"),
          enabled: () => false,
          innerHTML: _svg.default.hr,
          title: "Insert horizontal line",
          hotkey: "Mod2-Shift-L"
        }
      };
      var CommandBar = class {
        constructor(props) {
          this.e = null;
          this.editor = null;
          this.commands = [];
          this.buttons = {};
          this.state = {};
          this.hotkeys = [];
          let element = props.element;
          if (element && !element.tagName) {
            element = document.getElementById(props.element);
          }
          if (!element) {
            element = document.body;
          }
          this.createCommandBarElement(element, props.commands || ["bold", "italic", "strikethrough", "|", "code", "|", "h1", "h2", "|", "ul", "ol", "|", "blockquote", "hr", "|", "insertLink", "insertImage"]);
          document.addEventListener("keydown", (e) => this.handleKeydown(e));
          if (props.editor)
            this.setEditor(props.editor);
        }
        createCommandBarElement(parentElement, commands) {
          this.e = document.createElement("div");
          this.e.className = "TMCommandBar";
          for (let command of commands) {
            if (command == "|") {
              let el = document.createElement("div");
              el.className = "TMCommandDivider";
              this.e.appendChild(el);
            } else {
              let commandName;
              if (typeof command == "string") {
                if (DefaultCommands[command]) {
                  commandName = command;
                  this.commands[commandName] = DefaultCommands[commandName];
                } else {
                  continue;
                }
              } else if (typeof command == "object" && command.name) {
                commandName = command.name;
                this.commands[commandName] = {};
                if (DefaultCommands[commandName])
                  Object.assign(this.commands[commandName], DefaultCommands[commandName]);
                Object.assign(this.commands[commandName], command);
              } else {
                continue;
              }
              let title = this.commands[commandName].title || commandName;
              if (this.commands[commandName].hotkey) {
                const keys = this.commands[commandName].hotkey.split("-");
                let modifiers = [];
                let modifierexplanation = [];
                for (let i = 0; i < keys.length - 1; i++) {
                  switch (keys[i]) {
                    case "Ctrl":
                      modifiers.push("ctrlKey");
                      modifierexplanation.push("Ctrl");
                      break;
                    case "Cmd":
                      modifiers.push("metaKey");
                      modifierexplanation.push("\u2318");
                      break;
                    case "Alt":
                      modifiers.push("altKey");
                      modifierexplanation.push("Alt");
                      break;
                    case "Option":
                      modifiers.push("altKey");
                      modifierexplanation.push("\u2325");
                      break;
                    case "Win":
                      modifiers.push("metaKey");
                      modifierexplanation.push("\u229E Win");
                      break;
                    case "Shift":
                      modifiers.push("shiftKey");
                      modifierexplanation.push("\u21E7");
                      break;
                    case "Mod":
                      if (isMacLike) {
                        modifiers.push("metaKey");
                        modifierexplanation.push("\u2318");
                      } else {
                        modifiers.push("ctrlKey");
                        modifierexplanation.push("Ctrl");
                      }
                      break;
                    case "Mod2":
                      modifiers.push("altKey");
                      if (isMacLike)
                        modifierexplanation.push("\u2325");
                      else
                        modifierexplanation.push("Alt");
                      break;
                  }
                }
                modifierexplanation.push(keys[keys.length - 1]);
                let hotkey = {
                  modifiers,
                  command: commandName
                };
                if (keys[keys.length - 1].match(/^[0-9]$/)) {
                  hotkey.code = `Digit${keys[keys.length - 1]}`;
                } else {
                  hotkey.key = keys[keys.length - 1].toLowerCase();
                }
                this.hotkeys.push(hotkey);
                title = title.concat(` (${modifierexplanation.join("+")})`);
              }
              this.buttons[commandName] = document.createElement("div");
              this.buttons[commandName].className = "TMCommandButton TMCommandButton_Disabled";
              this.buttons[commandName].title = title;
              this.buttons[commandName].innerHTML = this.commands[commandName].innerHTML;
              this.buttons[commandName].addEventListener("mousedown", (e) => this.handleClick(commandName, e));
              this.e.appendChild(this.buttons[commandName]);
            }
          }
          parentElement.appendChild(this.e);
        }
        handleClick(commandName, event) {
          if (!this.editor)
            return;
          event.preventDefault();
          if (typeof this.commands[commandName].action == "string") {
            if (this.state[commandName] === false)
              this.editor.setCommandState(commandName, true);
            else
              this.editor.setCommandState(commandName, false);
          } else if (typeof this.commands[commandName].action == "function") {
            this.commands[commandName].action(this.editor);
          }
        }
        setEditor(editor) {
          this.editor = editor;
          editor.addEventListener("selection", (e) => this.handleSelection(e));
        }
        handleSelection(event) {
          if (event.commandState) {
            for (let command in this.commands) {
              if (event.commandState[command] === void 0) {
                if (this.commands[command].enabled)
                  this.state[command] = this.commands[command].enabled(this.editor, event.focus, event.anchor);
                else
                  this.state[command] = event.focus ? false : null;
              } else {
                this.state[command] = event.commandState[command];
              }
              if (this.state[command] === true) {
                this.buttons[command].className = "TMCommandButton TMCommandButton_Active";
              } else if (this.state[command] === false) {
                this.buttons[command].className = "TMCommandButton TMCommandButton_Inactive";
              } else {
                this.buttons[command].className = "TMCommandButton TMCommandButton_Disabled";
              }
            }
          }
        }
        handleKeydown(event) {
          outer:
            for (let hotkey of this.hotkeys) {
              if (hotkey.key && event.key.toLowerCase() == hotkey.key || hotkey.code && event.code == hotkey.code) {
                for (let modifier of hotkey.modifiers) {
                  if (!event[modifier])
                    continue outer;
                }
                this.handleClick(hotkey.command, event);
                return;
              }
            }
        }
      };
      var _default = exports.default = CommandBar;
    }
  });

  // node_modules/core-js/internals/global.js
  var require_global = __commonJS({
    "node_modules/core-js/internals/global.js"(exports, module) {
      "use strict";
      var check = function(it) {
        return it && it.Math === Math && it;
      };
      module.exports = // eslint-disable-next-line es/no-global-this -- safe
      check(typeof globalThis == "object" && globalThis) || check(typeof window == "object" && window) || // eslint-disable-next-line no-restricted-globals -- safe
      check(typeof self == "object" && self) || check(typeof global == "object" && global) || check(typeof exports == "object" && exports) || // eslint-disable-next-line no-new-func -- fallback
      function() {
        return this;
      }() || Function("return this")();
    }
  });

  // node_modules/core-js/internals/fails.js
  var require_fails = __commonJS({
    "node_modules/core-js/internals/fails.js"(exports, module) {
      "use strict";
      module.exports = function(exec) {
        try {
          return !!exec();
        } catch (error) {
          return true;
        }
      };
    }
  });

  // node_modules/core-js/internals/descriptors.js
  var require_descriptors = __commonJS({
    "node_modules/core-js/internals/descriptors.js"(exports, module) {
      "use strict";
      var fails = require_fails();
      module.exports = !fails(function() {
        return Object.defineProperty({}, 1, { get: function() {
          return 7;
        } })[1] !== 7;
      });
    }
  });

  // node_modules/core-js/internals/function-bind-native.js
  var require_function_bind_native = __commonJS({
    "node_modules/core-js/internals/function-bind-native.js"(exports, module) {
      "use strict";
      var fails = require_fails();
      module.exports = !fails(function() {
        var test = function() {
        }.bind();
        return typeof test != "function" || test.hasOwnProperty("prototype");
      });
    }
  });

  // node_modules/core-js/internals/function-uncurry-this.js
  var require_function_uncurry_this = __commonJS({
    "node_modules/core-js/internals/function-uncurry-this.js"(exports, module) {
      "use strict";
      var NATIVE_BIND = require_function_bind_native();
      var FunctionPrototype = Function.prototype;
      var call = FunctionPrototype.call;
      var uncurryThisWithBind = NATIVE_BIND && FunctionPrototype.bind.bind(call, call);
      module.exports = NATIVE_BIND ? uncurryThisWithBind : function(fn) {
        return function() {
          return call.apply(fn, arguments);
        };
      };
    }
  });

  // node_modules/core-js/internals/document-all.js
  var require_document_all = __commonJS({
    "node_modules/core-js/internals/document-all.js"(exports, module) {
      "use strict";
      var documentAll = typeof document == "object" && document.all;
      var IS_HTMLDDA = typeof documentAll == "undefined" && documentAll !== void 0;
      module.exports = {
        all: documentAll,
        IS_HTMLDDA
      };
    }
  });

  // node_modules/core-js/internals/is-callable.js
  var require_is_callable = __commonJS({
    "node_modules/core-js/internals/is-callable.js"(exports, module) {
      "use strict";
      var $documentAll = require_document_all();
      var documentAll = $documentAll.all;
      module.exports = $documentAll.IS_HTMLDDA ? function(argument) {
        return typeof argument == "function" || argument === documentAll;
      } : function(argument) {
        return typeof argument == "function";
      };
    }
  });

  // node_modules/core-js/internals/is-null-or-undefined.js
  var require_is_null_or_undefined = __commonJS({
    "node_modules/core-js/internals/is-null-or-undefined.js"(exports, module) {
      "use strict";
      module.exports = function(it) {
        return it === null || it === void 0;
      };
    }
  });

  // node_modules/core-js/internals/require-object-coercible.js
  var require_require_object_coercible = __commonJS({
    "node_modules/core-js/internals/require-object-coercible.js"(exports, module) {
      "use strict";
      var isNullOrUndefined = require_is_null_or_undefined();
      var $TypeError = TypeError;
      module.exports = function(it) {
        if (isNullOrUndefined(it))
          throw new $TypeError("Can't call method on " + it);
        return it;
      };
    }
  });

  // node_modules/core-js/internals/to-object.js
  var require_to_object = __commonJS({
    "node_modules/core-js/internals/to-object.js"(exports, module) {
      "use strict";
      var requireObjectCoercible = require_require_object_coercible();
      var $Object = Object;
      module.exports = function(argument) {
        return $Object(requireObjectCoercible(argument));
      };
    }
  });

  // node_modules/core-js/internals/has-own-property.js
  var require_has_own_property = __commonJS({
    "node_modules/core-js/internals/has-own-property.js"(exports, module) {
      "use strict";
      var uncurryThis = require_function_uncurry_this();
      var toObject = require_to_object();
      var hasOwnProperty = uncurryThis({}.hasOwnProperty);
      module.exports = Object.hasOwn || function hasOwn(it, key) {
        return hasOwnProperty(toObject(it), key);
      };
    }
  });

  // node_modules/core-js/internals/function-name.js
  var require_function_name = __commonJS({
    "node_modules/core-js/internals/function-name.js"(exports, module) {
      "use strict";
      var DESCRIPTORS = require_descriptors();
      var hasOwn = require_has_own_property();
      var FunctionPrototype = Function.prototype;
      var getDescriptor = DESCRIPTORS && Object.getOwnPropertyDescriptor;
      var EXISTS = hasOwn(FunctionPrototype, "name");
      var PROPER = EXISTS && function something() {
      }.name === "something";
      var CONFIGURABLE = EXISTS && (!DESCRIPTORS || DESCRIPTORS && getDescriptor(FunctionPrototype, "name").configurable);
      module.exports = {
        EXISTS,
        PROPER,
        CONFIGURABLE
      };
    }
  });

  // node_modules/core-js/internals/define-global-property.js
  var require_define_global_property = __commonJS({
    "node_modules/core-js/internals/define-global-property.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var defineProperty = Object.defineProperty;
      module.exports = function(key, value) {
        try {
          defineProperty(global2, key, { value, configurable: true, writable: true });
        } catch (error) {
          global2[key] = value;
        }
        return value;
      };
    }
  });

  // node_modules/core-js/internals/shared-store.js
  var require_shared_store = __commonJS({
    "node_modules/core-js/internals/shared-store.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var defineGlobalProperty = require_define_global_property();
      var SHARED = "__core-js_shared__";
      var store = global2[SHARED] || defineGlobalProperty(SHARED, {});
      module.exports = store;
    }
  });

  // node_modules/core-js/internals/inspect-source.js
  var require_inspect_source = __commonJS({
    "node_modules/core-js/internals/inspect-source.js"(exports, module) {
      "use strict";
      var uncurryThis = require_function_uncurry_this();
      var isCallable = require_is_callable();
      var store = require_shared_store();
      var functionToString = uncurryThis(Function.toString);
      if (!isCallable(store.inspectSource)) {
        store.inspectSource = function(it) {
          return functionToString(it);
        };
      }
      module.exports = store.inspectSource;
    }
  });

  // node_modules/core-js/internals/weak-map-basic-detection.js
  var require_weak_map_basic_detection = __commonJS({
    "node_modules/core-js/internals/weak-map-basic-detection.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var isCallable = require_is_callable();
      var WeakMap = global2.WeakMap;
      module.exports = isCallable(WeakMap) && /native code/.test(String(WeakMap));
    }
  });

  // node_modules/core-js/internals/is-object.js
  var require_is_object = __commonJS({
    "node_modules/core-js/internals/is-object.js"(exports, module) {
      "use strict";
      var isCallable = require_is_callable();
      var $documentAll = require_document_all();
      var documentAll = $documentAll.all;
      module.exports = $documentAll.IS_HTMLDDA ? function(it) {
        return typeof it == "object" ? it !== null : isCallable(it) || it === documentAll;
      } : function(it) {
        return typeof it == "object" ? it !== null : isCallable(it);
      };
    }
  });

  // node_modules/core-js/internals/document-create-element.js
  var require_document_create_element = __commonJS({
    "node_modules/core-js/internals/document-create-element.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var isObject = require_is_object();
      var document2 = global2.document;
      var EXISTS = isObject(document2) && isObject(document2.createElement);
      module.exports = function(it) {
        return EXISTS ? document2.createElement(it) : {};
      };
    }
  });

  // node_modules/core-js/internals/ie8-dom-define.js
  var require_ie8_dom_define = __commonJS({
    "node_modules/core-js/internals/ie8-dom-define.js"(exports, module) {
      "use strict";
      var DESCRIPTORS = require_descriptors();
      var fails = require_fails();
      var createElement = require_document_create_element();
      module.exports = !DESCRIPTORS && !fails(function() {
        return Object.defineProperty(createElement("div"), "a", {
          get: function() {
            return 7;
          }
        }).a !== 7;
      });
    }
  });

  // node_modules/core-js/internals/v8-prototype-define-bug.js
  var require_v8_prototype_define_bug = __commonJS({
    "node_modules/core-js/internals/v8-prototype-define-bug.js"(exports, module) {
      "use strict";
      var DESCRIPTORS = require_descriptors();
      var fails = require_fails();
      module.exports = DESCRIPTORS && fails(function() {
        return Object.defineProperty(function() {
        }, "prototype", {
          value: 42,
          writable: false
        }).prototype !== 42;
      });
    }
  });

  // node_modules/core-js/internals/an-object.js
  var require_an_object = __commonJS({
    "node_modules/core-js/internals/an-object.js"(exports, module) {
      "use strict";
      var isObject = require_is_object();
      var $String = String;
      var $TypeError = TypeError;
      module.exports = function(argument) {
        if (isObject(argument))
          return argument;
        throw new $TypeError($String(argument) + " is not an object");
      };
    }
  });

  // node_modules/core-js/internals/function-call.js
  var require_function_call = __commonJS({
    "node_modules/core-js/internals/function-call.js"(exports, module) {
      "use strict";
      var NATIVE_BIND = require_function_bind_native();
      var call = Function.prototype.call;
      module.exports = NATIVE_BIND ? call.bind(call) : function() {
        return call.apply(call, arguments);
      };
    }
  });

  // node_modules/core-js/internals/get-built-in.js
  var require_get_built_in = __commonJS({
    "node_modules/core-js/internals/get-built-in.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var isCallable = require_is_callable();
      var aFunction = function(argument) {
        return isCallable(argument) ? argument : void 0;
      };
      module.exports = function(namespace, method) {
        return arguments.length < 2 ? aFunction(global2[namespace]) : global2[namespace] && global2[namespace][method];
      };
    }
  });

  // node_modules/core-js/internals/object-is-prototype-of.js
  var require_object_is_prototype_of = __commonJS({
    "node_modules/core-js/internals/object-is-prototype-of.js"(exports, module) {
      "use strict";
      var uncurryThis = require_function_uncurry_this();
      module.exports = uncurryThis({}.isPrototypeOf);
    }
  });

  // node_modules/core-js/internals/engine-user-agent.js
  var require_engine_user_agent = __commonJS({
    "node_modules/core-js/internals/engine-user-agent.js"(exports, module) {
      "use strict";
      module.exports = typeof navigator != "undefined" && String(navigator.userAgent) || "";
    }
  });

  // node_modules/core-js/internals/engine-v8-version.js
  var require_engine_v8_version = __commonJS({
    "node_modules/core-js/internals/engine-v8-version.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var userAgent = require_engine_user_agent();
      var process = global2.process;
      var Deno = global2.Deno;
      var versions = process && process.versions || Deno && Deno.version;
      var v8 = versions && versions.v8;
      var match;
      var version;
      if (v8) {
        match = v8.split(".");
        version = match[0] > 0 && match[0] < 4 ? 1 : +(match[0] + match[1]);
      }
      if (!version && userAgent) {
        match = userAgent.match(/Edge\/(\d+)/);
        if (!match || match[1] >= 74) {
          match = userAgent.match(/Chrome\/(\d+)/);
          if (match)
            version = +match[1];
        }
      }
      module.exports = version;
    }
  });

  // node_modules/core-js/internals/symbol-constructor-detection.js
  var require_symbol_constructor_detection = __commonJS({
    "node_modules/core-js/internals/symbol-constructor-detection.js"(exports, module) {
      "use strict";
      var V8_VERSION = require_engine_v8_version();
      var fails = require_fails();
      var global2 = require_global();
      var $String = global2.String;
      module.exports = !!Object.getOwnPropertySymbols && !fails(function() {
        var symbol = Symbol("symbol detection");
        return !$String(symbol) || !(Object(symbol) instanceof Symbol) || // Chrome 38-40 symbols are not inherited from DOM collections prototypes to instances
        !Symbol.sham && V8_VERSION && V8_VERSION < 41;
      });
    }
  });

  // node_modules/core-js/internals/use-symbol-as-uid.js
  var require_use_symbol_as_uid = __commonJS({
    "node_modules/core-js/internals/use-symbol-as-uid.js"(exports, module) {
      "use strict";
      var NATIVE_SYMBOL = require_symbol_constructor_detection();
      module.exports = NATIVE_SYMBOL && !Symbol.sham && typeof Symbol.iterator == "symbol";
    }
  });

  // node_modules/core-js/internals/is-symbol.js
  var require_is_symbol = __commonJS({
    "node_modules/core-js/internals/is-symbol.js"(exports, module) {
      "use strict";
      var getBuiltIn = require_get_built_in();
      var isCallable = require_is_callable();
      var isPrototypeOf = require_object_is_prototype_of();
      var USE_SYMBOL_AS_UID = require_use_symbol_as_uid();
      var $Object = Object;
      module.exports = USE_SYMBOL_AS_UID ? function(it) {
        return typeof it == "symbol";
      } : function(it) {
        var $Symbol = getBuiltIn("Symbol");
        return isCallable($Symbol) && isPrototypeOf($Symbol.prototype, $Object(it));
      };
    }
  });

  // node_modules/core-js/internals/try-to-string.js
  var require_try_to_string = __commonJS({
    "node_modules/core-js/internals/try-to-string.js"(exports, module) {
      "use strict";
      var $String = String;
      module.exports = function(argument) {
        try {
          return $String(argument);
        } catch (error) {
          return "Object";
        }
      };
    }
  });

  // node_modules/core-js/internals/a-callable.js
  var require_a_callable = __commonJS({
    "node_modules/core-js/internals/a-callable.js"(exports, module) {
      "use strict";
      var isCallable = require_is_callable();
      var tryToString = require_try_to_string();
      var $TypeError = TypeError;
      module.exports = function(argument) {
        if (isCallable(argument))
          return argument;
        throw new $TypeError(tryToString(argument) + " is not a function");
      };
    }
  });

  // node_modules/core-js/internals/get-method.js
  var require_get_method = __commonJS({
    "node_modules/core-js/internals/get-method.js"(exports, module) {
      "use strict";
      var aCallable = require_a_callable();
      var isNullOrUndefined = require_is_null_or_undefined();
      module.exports = function(V, P) {
        var func = V[P];
        return isNullOrUndefined(func) ? void 0 : aCallable(func);
      };
    }
  });

  // node_modules/core-js/internals/ordinary-to-primitive.js
  var require_ordinary_to_primitive = __commonJS({
    "node_modules/core-js/internals/ordinary-to-primitive.js"(exports, module) {
      "use strict";
      var call = require_function_call();
      var isCallable = require_is_callable();
      var isObject = require_is_object();
      var $TypeError = TypeError;
      module.exports = function(input, pref) {
        var fn, val;
        if (pref === "string" && isCallable(fn = input.toString) && !isObject(val = call(fn, input)))
          return val;
        if (isCallable(fn = input.valueOf) && !isObject(val = call(fn, input)))
          return val;
        if (pref !== "string" && isCallable(fn = input.toString) && !isObject(val = call(fn, input)))
          return val;
        throw new $TypeError("Can't convert object to primitive value");
      };
    }
  });

  // node_modules/core-js/internals/is-pure.js
  var require_is_pure = __commonJS({
    "node_modules/core-js/internals/is-pure.js"(exports, module) {
      "use strict";
      module.exports = false;
    }
  });

  // node_modules/core-js/internals/shared.js
  var require_shared = __commonJS({
    "node_modules/core-js/internals/shared.js"(exports, module) {
      "use strict";
      var IS_PURE = require_is_pure();
      var store = require_shared_store();
      (module.exports = function(key, value) {
        return store[key] || (store[key] = value !== void 0 ? value : {});
      })("versions", []).push({
        version: "3.33.3",
        mode: IS_PURE ? "pure" : "global",
        copyright: "\xA9 2014-2023 Denis Pushkarev (zloirock.ru)",
        license: "https://github.com/zloirock/core-js/blob/v3.33.3/LICENSE",
        source: "https://github.com/zloirock/core-js"
      });
    }
  });

  // node_modules/core-js/internals/uid.js
  var require_uid = __commonJS({
    "node_modules/core-js/internals/uid.js"(exports, module) {
      "use strict";
      var uncurryThis = require_function_uncurry_this();
      var id = 0;
      var postfix = Math.random();
      var toString = uncurryThis(1 .toString);
      module.exports = function(key) {
        return "Symbol(" + (key === void 0 ? "" : key) + ")_" + toString(++id + postfix, 36);
      };
    }
  });

  // node_modules/core-js/internals/well-known-symbol.js
  var require_well_known_symbol = __commonJS({
    "node_modules/core-js/internals/well-known-symbol.js"(exports, module) {
      "use strict";
      var global2 = require_global();
      var shared = require_shared();
      var hasOwn = require_has_own_property();
      var uid = require_uid();
      var NATIVE_SYMBOL = require_symbol_constructor_detection();
      var USE_SYMBOL_AS_UID = require_use_symbol_as_uid();
      var Symbol2 = global2.Symbol;
      var WellKnownSymbolsStore = shared("wks");
      var createWellKnownSymbol = USE_SYMBOL_AS_UID ? Symbol2["for"] || Symbol2 : Symbol2 && Symbol2.withoutSetter || uid;
      module.exports = function(name) {
        if (!hasOwn(WellKnownSymbolsStore, name)) {
          WellKnownSymbolsStore[name] = NATIVE_SYMBOL && hasOwn(Symbol2, name) ? Symbol2[name] : createWellKnownSymbol("Symbol." + name);
        }
        return WellKnownSymbolsStore[name];
      };
    }
  });

  // node_modules/core-js/internals/to-primitive.js
  var require_to_primitive = __commonJS({
    "node_modules/core-js/internals/to-primitive.js"(exports, module) {
      "use strict";
      var call = require_function_call();
      var isObject = require_is_object();
      var isSymbol = require_is_symbol();
      var getMethod = require_get_method();
      var ordinaryToPrimitive = require_ordinary_to_primitive();
      var wellKnownSymbol = require_well_known_symbol();
      var $TypeError = TypeError;
      var TO_PRIMITIVE = wellKnownSymbol("toPrimitive");
      module.exports = function(input, pref) {
        if (!isObject(input) || isSymbol(input))
          return input;
        var exoticToPrim = getMethod(input, TO_PRIMITIVE);
        var result;
        if (exoticToPrim) {
          if (pref === void 0)
            pref = "default";
          result = call(exoticToPrim, input, pref);
          if (!isObject(result) || isSymbol(result))
            return result;
          throw new $TypeError("Can't convert object to primitive value");
        }
        if (pref === void 0)
          pref = "number";
        return ordinaryToPrimitive(input, pref);
      };
    }
  });

  // node_modules/core-js/internals/to-property-key.js
  var require_to_property_key = __commonJS({
    "node_modules/core-js/internals/to-property-key.js"(exports, module) {
      "use strict";
      var toPrimitive = require_to_primitive();
      var isSymbol = require_is_symbol();
      module.exports = function(argument) {
        var key = toPrimitive(argument, "string");
        return isSymbol(key) ? key : key + "";
      };
    }
  });

  // node_modules/core-js/internals/object-define-property.js
  var require_object_define_property = __commonJS({
    "node_modules/core-js/internals/object-define-property.js"(exports) {
      "use strict";
      var DESCRIPTORS = require_descriptors();
      var IE8_DOM_DEFINE = require_ie8_dom_define();
      var V8_PROTOTYPE_DEFINE_BUG = require_v8_prototype_define_bug();
      var anObject = require_an_object();
      var toPropertyKey = require_to_property_key();
      var $TypeError = TypeError;
      var $defineProperty = Object.defineProperty;
      var $getOwnPropertyDescriptor = Object.getOwnPropertyDescriptor;
      var ENUMERABLE = "enumerable";
      var CONFIGURABLE = "configurable";
      var WRITABLE = "writable";
      exports.f = DESCRIPTORS ? V8_PROTOTYPE_DEFINE_BUG ? function defineProperty(O, P, Attributes) {
        anObject(O);
        P = toPropertyKey(P);
        anObject(Attributes);
        if (typeof O === "function" && P === "prototype" && "value" in Attributes && WRITABLE in Attributes && !Attributes[WRITABLE]) {
          var current = $getOwnPropertyDescriptor(O, P);
          if (current && current[WRITABLE]) {
            O[P] = Attributes.value;
            Attributes = {
              configurable: CONFIGURABLE in Attributes ? Attributes[CONFIGURABLE] : current[CONFIGURABLE],
              enumerable: ENUMERABLE in Attributes ? Attributes[ENUMERABLE] : current[ENUMERABLE],
              writable: false
            };
          }
        }
        return $defineProperty(O, P, Attributes);
      } : $defineProperty : function defineProperty(O, P, Attributes) {
        anObject(O);
        P = toPropertyKey(P);
        anObject(Attributes);
        if (IE8_DOM_DEFINE)
          try {
            return $defineProperty(O, P, Attributes);
          } catch (error) {
          }
        if ("get" in Attributes || "set" in Attributes)
          throw new $TypeError("Accessors not supported");
        if ("value" in Attributes)
          O[P] = Attributes.value;
        return O;
      };
    }
  });

  // node_modules/core-js/internals/create-property-descriptor.js
  var require_create_property_descriptor = __commonJS({
    "node_modules/core-js/internals/create-property-descriptor.js"(exports, module) {
      "use strict";
      module.exports = function(bitmap, value) {
        return {
          enumerable: !(bitmap & 1),
          configurable: !(bitmap & 2),
          writable: !(bitmap & 4),
          value
        };
      };
    }
  });

  // node_modules/core-js/internals/create-non-enumerable-property.js
  var require_create_non_enumerable_property = __commonJS({
    "node_modules/core-js/internals/create-non-enumerable-property.js"(exports, module) {
      "use strict";
      var DESCRIPTORS = require_descriptors();
      var definePropertyModule = require_object_define_property();
      var createPropertyDescriptor = require_create_property_descriptor();
      module.exports = DESCRIPTORS ? function(object, key, value) {
        return definePropertyModule.f(object, key, createPropertyDescriptor(1, value));
      } : function(object, key, value) {
        object[key] = value;
        return object;
      };
    }
  });

  // node_modules/core-js/internals/shared-key.js
  var require_shared_key = __commonJS({
    "node_modules/core-js/internals/shared-key.js"(exports, module) {
      "use strict";
      var shared = require_shared();
      var uid = require_uid();
      var keys = shared("keys");
      module.exports = function(key) {
        return keys[key] || (keys[key] = uid(key));
      };
    }
  });

  // node_modules/core-js/internals/hidden-keys.js
  var require_hidden_keys = __commonJS({
    "node_modules/core-js/internals/hidden-keys.js"(exports, module) {
      "use strict";
      module.exports = {};
    }
  });

  // node_modules/core-js/internals/internal-state.js
  var require_internal_state = __commonJS({
    "node_modules/core-js/internals/internal-state.js"(exports, module) {
      "use strict";
      var NATIVE_WEAK_MAP = require_weak_map_basic_detection();
      var global2 = require_global();
      var isObject = require_is_object();
      var createNonEnumerableProperty = require_create_non_enumerable_property();
      var hasOwn = require_has_own_property();
      var shared = require_shared_store();
      var sharedKey = require_shared_key();
      var hiddenKeys = require_hidden_keys();
      var OBJECT_ALREADY_INITIALIZED = "Object already initialized";
      var TypeError2 = global2.TypeError;
      var WeakMap = global2.WeakMap;
      var set;
      var get;
      var has;
      var enforce = function(it) {
        return has(it) ? get(it) : set(it, {});
      };
      var getterFor = function(TYPE) {
        return function(it) {
          var state;
          if (!isObject(it) || (state = get(it)).type !== TYPE) {
            throw new TypeError2("Incompatible receiver, " + TYPE + " required");
          }
          return state;
        };
      };
      if (NATIVE_WEAK_MAP || shared.state) {
        store = shared.state || (shared.state = new WeakMap());
        store.get = store.get;
        store.has = store.has;
        store.set = store.set;
        set = function(it, metadata) {
          if (store.has(it))
            throw new TypeError2(OBJECT_ALREADY_INITIALIZED);
          metadata.facade = it;
          store.set(it, metadata);
          return metadata;
        };
        get = function(it) {
          return store.get(it) || {};
        };
        has = function(it) {
          return store.has(it);
        };
      } else {
        STATE = sharedKey("state");
        hiddenKeys[STATE] = true;
        set = function(it, metadata) {
          if (hasOwn(it, STATE))
            throw new TypeError2(OBJECT_ALREADY_INITIALIZED);
          metadata.facade = it;
          createNonEnumerableProperty(it, STATE, metadata);
          return metadata;
        };
        get = function(it) {
          return hasOwn(it, STATE) ? it[STATE] : {};
        };
        has = function(it) {
          return hasOwn(it, STATE);
        };
      }
      var store;
      var STATE;
      module.exports = {
        set,
        get,
        has,
        enforce,
        getterFor
      };
    }
  });

  // node_modules/core-js/internals/make-built-in.js
  var require_make_built_in = __commonJS({
    "node_modules/core-js/internals/make-built-in.js"(exports, module) {
      "use strict";
      var uncurryThis = require_function_uncurry_this();
      var fails = require_fails();
      var isCallable = require_is_callable();
      var hasOwn = require_has_own_property();
      var DESCRIPTORS = require_descriptors();
      var CONFIGURABLE_FUNCTION_NAME = require_function_name().CONFIGURABLE;
      var inspectSource = require_inspect_source();
      var InternalStateModule = require_internal_state();
      var enforceInternalState = InternalStateModule.enforce;
      var getInternalState = InternalStateModule.get;
      var $String = String;
      var defineProperty = Object.defineProperty;
      var stringSlice = uncurryThis("".slice);
      var replace = uncurryThis("".replace);
      var join = uncurryThis([].join);
      var CONFIGURABLE_LENGTH = DESCRIPTORS && !fails(function() {
        return defineProperty(function() {
        }, "length", { value: 8 }).length !== 8;
      });
      var TEMPLATE = String(String).split("String");
      var makeBuiltIn = module.exports = function(value, name, options) {
        if (stringSlice($String(name), 0, 7) === "Symbol(") {
          name = "[" + replace($String(name), /^Symbol\(([^)]*)\)/, "$1") + "]";
        }
        if (options && options.getter)
          name = "get " + name;
        if (options && options.setter)
          name = "set " + name;
        if (!hasOwn(value, "name") || CONFIGURABLE_FUNCTION_NAME && value.name !== name) {
          if (DESCRIPTORS)
            defineProperty(value, "name", { value: name, configurable: true });
          else
            value.name = name;
        }
        if (CONFIGURABLE_LENGTH && options && hasOwn(options, "arity") && value.length !== options.arity) {
          defineProperty(value, "length", { value: options.arity });
        }
        try {
          if (options && hasOwn(options, "constructor") && options.constructor) {
            if (DESCRIPTORS)
              defineProperty(value, "prototype", { writable: false });
          } else if (value.prototype)
            value.prototype = void 0;
        } catch (error) {
        }
        var state = enforceInternalState(value);
        if (!hasOwn(state, "source")) {
          state.source = join(TEMPLATE, typeof name == "string" ? name : "");
        }
        return value;
      };
      Function.prototype.toString = makeBuiltIn(function toString() {
        return isCallable(this) && getInternalState(this).source || inspectSource(this);
      }, "toString");
    }
  });

  // node_modules/core-js/internals/define-built-in-accessor.js
  var require_define_built_in_accessor = __commonJS({
    "node_modules/core-js/internals/define-built-in-accessor.js"(exports, module) {
      "use strict";
      var makeBuiltIn = require_make_built_in();
      var defineProperty = require_object_define_property();
      module.exports = function(target, name, descriptor) {
        if (descriptor.get)
          makeBuiltIn(descriptor.get, name, { getter: true });
        if (descriptor.set)
          makeBuiltIn(descriptor.set, name, { setter: true });
        return defineProperty.f(target, name, descriptor);
      };
    }
  });

  // node_modules/core-js/internals/regexp-flags.js
  var require_regexp_flags = __commonJS({
    "node_modules/core-js/internals/regexp-flags.js"(exports, module) {
      "use strict";
      var anObject = require_an_object();
      module.exports = function() {
        var that = anObject(this);
        var result = "";
        if (that.hasIndices)
          result += "d";
        if (that.global)
          result += "g";
        if (that.ignoreCase)
          result += "i";
        if (that.multiline)
          result += "m";
        if (that.dotAll)
          result += "s";
        if (that.unicode)
          result += "u";
        if (that.unicodeSets)
          result += "v";
        if (that.sticky)
          result += "y";
        return result;
      };
    }
  });

  // node_modules/core-js/modules/es.regexp.flags.js
  var require_es_regexp_flags = __commonJS({
    "node_modules/core-js/modules/es.regexp.flags.js"() {
      "use strict";
      var global2 = require_global();
      var DESCRIPTORS = require_descriptors();
      var defineBuiltInAccessor = require_define_built_in_accessor();
      var regExpFlags = require_regexp_flags();
      var fails = require_fails();
      var RegExp2 = global2.RegExp;
      var RegExpPrototype = RegExp2.prototype;
      var FORCED = DESCRIPTORS && fails(function() {
        var INDICES_SUPPORT = true;
        try {
          RegExp2(".", "d");
        } catch (error) {
          INDICES_SUPPORT = false;
        }
        var O = {};
        var calls = "";
        var expected = INDICES_SUPPORT ? "dgimsy" : "gimsy";
        var addGetter = function(key2, chr) {
          Object.defineProperty(O, key2, { get: function() {
            calls += chr;
            return true;
          } });
        };
        var pairs = {
          dotAll: "s",
          global: "g",
          ignoreCase: "i",
          multiline: "m",
          sticky: "y"
        };
        if (INDICES_SUPPORT)
          pairs.hasIndices = "d";
        for (var key in pairs)
          addGetter(key, pairs[key]);
        var result = Object.getOwnPropertyDescriptor(RegExpPrototype, "flags").get.call(O);
        return result !== expected || calls !== expected;
      });
      if (FORCED)
        defineBuiltInAccessor(RegExpPrototype, "flags", {
          configurable: true,
          get: regExpFlags
        });
    }
  });

  // node_modules/tiny-markdown-editor/lib/grammar.js
  var require_grammar = __commonJS({
    "node_modules/tiny-markdown-editor/lib/grammar.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", {
        value: true
      });
      exports.htmlBlockGrammar = exports.commands = void 0;
      exports.htmlescape = htmlescape;
      exports.punctuationTrailing = exports.punctuationLeading = exports.lineGrammar = exports.inlineGrammar = void 0;
      require_es_regexp_flags();
      var replacements = {
        ASCIIPunctuation: /[!"#$%&'()*+,\-./:;<=>?@[\]^_`{|}~\\]/,
        NotTriggerChar: /[^`_*[\]()<>!~]/,
        Scheme: /[A-Za-z][A-Za-z0-9+.-]{1,31}/,
        Email: /[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*/,
        // From CommonMark spec
        HTMLOpenTag: /<HTMLTagName(?:HTMLAttribute)*\s*\/?>/,
        HTMLCloseTag: /<\/HTMLTagName\s*>/,
        HTMLTagName: /[A-Za-z][A-Za-z0-9-]*/,
        HTMLComment: /<!--(?:[^>-]|(?:[^>-](?:[^-]|-[^-])*[^-]))-->/,
        HTMLPI: /<\?(?:|.|(?:[^?]|\?[^>])*)\?>/,
        HTMLDeclaration: /<![A-Z]+\s[^>]*>/,
        HTMLCDATA: /<!\[CDATA\[.*?\]\]>/,
        HTMLAttribute: /\s+[A-Za-z_:][A-Za-z0-9_.:-]*(?:HTMLAttValue)?/,
        HTMLAttValue: /\s*=\s*(?:(?:'[^']*')|(?:"[^"]*")|(?:[^\s"'=<>`]+))/,
        KnownTag: /address|article|aside|base|basefont|blockquote|body|caption|center|col|colgroup|dd|details|dialog|dir|div|dl|dt|fieldset|figcaption|figure|footer|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|header|hr|html|iframe|legend|li|link|main|menu|menuitem|nav|noframes|ol|optgroup|option|p|param|section|source|summary|table|tbody|td|tfoot|th|thead|title|tr|track|ul/
      };
      var punctuationLeading = exports.punctuationLeading = new RegExp(/^(?:[!"#$%&'()*+,\-./:;<=>?@[\]\\^_`{|}~\xA1\xA7\xAB\xB6\xB7\xBB\xBF\u037E\u0387\u055A-\u055F\u0589\u058A\u05BE\u05C0\u05C3\u05C6\u05F3\u05F4\u0609\u060A\u060C\u060D\u061B\u061E\u061F\u066A-\u066D\u06D4\u0700-\u070D\u07F7-\u07F9\u0830-\u083E\u085E\u0964\u0965\u0970\u0AF0\u0DF4\u0E4F\u0E5A\u0E5B\u0F04-\u0F12\u0F14\u0F3A-\u0F3D\u0F85\u0FD0-\u0FD4\u0FD9\u0FDA\u104A-\u104F\u10FB\u1360-\u1368\u1400\u166D\u166E\u169B\u169C\u16EB-\u16ED\u1735\u1736\u17D4-\u17D6\u17D8-\u17DA\u1800-\u180A\u1944\u1945\u1A1E\u1A1F\u1AA0-\u1AA6\u1AA8-\u1AAD\u1B5A-\u1B60\u1BFC-\u1BFF\u1C3B-\u1C3F\u1C7E\u1C7F\u1CC0-\u1CC7\u1CD3\u2010-\u2027\u2030-\u2043\u2045-\u2051\u2053-\u205E\u207D\u207E\u208D\u208E\u2308-\u230B\u2329\u232A\u2768-\u2775\u27C5\u27C6\u27E6-\u27EF\u2983-\u2998\u29D8-\u29DB\u29FC\u29FD\u2CF9-\u2CFC\u2CFE\u2CFF\u2D70\u2E00-\u2E2E\u2E30-\u2E42\u3001-\u3003\u3008-\u3011\u3014-\u301F\u3030\u303D\u30A0\u30FB\uA4FE\uA4FF\uA60D-\uA60F\uA673\uA67E\uA6F2-\uA6F7\uA874-\uA877\uA8CE\uA8CF\uA8F8-\uA8FA\uA8FC\uA92E\uA92F\uA95F\uA9C1-\uA9CD\uA9DE\uA9DF\uAA5C-\uAA5F\uAADE\uAADF\uAAF0\uAAF1\uABEB\uFD3E\uFD3F\uFE10-\uFE19\uFE30-\uFE52\uFE54-\uFE61\uFE63\uFE68\uFE6A\uFE6B\uFF01-\uFF03\uFF05-\uFF0A\uFF0C-\uFF0F\uFF1A\uFF1B\uFF1F\uFF20\uFF3B-\uFF3D\uFF3F\uFF5B\uFF5D\uFF5F-\uFF65]|\uD800[\uDD00-\uDD02\uDF9F\uDFD0]|\uD801\uDD6F|\uD802[\uDC57\uDD1F\uDD3F\uDE50-\uDE58\uDE7F\uDEF0-\uDEF6\uDF39-\uDF3F\uDF99-\uDF9C]|\uD804[\uDC47-\uDC4D\uDCBB\uDCBC\uDCBE-\uDCC1\uDD40-\uDD43\uDD74\uDD75\uDDC5-\uDDC9\uDDCD\uDDDB\uDDDD-\uDDDF\uDE38-\uDE3D\uDEA9]|\uD805[\uDCC6\uDDC1-\uDDD7\uDE41-\uDE43\uDF3C-\uDF3E]|\uD809[\uDC70-\uDC74]|\uD81A[\uDE6E\uDE6F\uDEF5\uDF37-\uDF3B\uDF44]|\uD82F\uDC9F|\uD836[\uDE87-\uDE8B])/);
      var punctuationTrailing = exports.punctuationTrailing = new RegExp(/(?:[!"#$%&'()*+,\-./:;<=>?@[\]\\^_`{|}~\xA1\xA7\xAB\xB6\xB7\xBB\xBF\u037E\u0387\u055A-\u055F\u0589\u058A\u05BE\u05C0\u05C3\u05C6\u05F3\u05F4\u0609\u060A\u060C\u060D\u061B\u061E\u061F\u066A-\u066D\u06D4\u0700-\u070D\u07F7-\u07F9\u0830-\u083E\u085E\u0964\u0965\u0970\u0AF0\u0DF4\u0E4F\u0E5A\u0E5B\u0F04-\u0F12\u0F14\u0F3A-\u0F3D\u0F85\u0FD0-\u0FD4\u0FD9\u0FDA\u104A-\u104F\u10FB\u1360-\u1368\u1400\u166D\u166E\u169B\u169C\u16EB-\u16ED\u1735\u1736\u17D4-\u17D6\u17D8-\u17DA\u1800-\u180A\u1944\u1945\u1A1E\u1A1F\u1AA0-\u1AA6\u1AA8-\u1AAD\u1B5A-\u1B60\u1BFC-\u1BFF\u1C3B-\u1C3F\u1C7E\u1C7F\u1CC0-\u1CC7\u1CD3\u2010-\u2027\u2030-\u2043\u2045-\u2051\u2053-\u205E\u207D\u207E\u208D\u208E\u2308-\u230B\u2329\u232A\u2768-\u2775\u27C5\u27C6\u27E6-\u27EF\u2983-\u2998\u29D8-\u29DB\u29FC\u29FD\u2CF9-\u2CFC\u2CFE\u2CFF\u2D70\u2E00-\u2E2E\u2E30-\u2E42\u3001-\u3003\u3008-\u3011\u3014-\u301F\u3030\u303D\u30A0\u30FB\uA4FE\uA4FF\uA60D-\uA60F\uA673\uA67E\uA6F2-\uA6F7\uA874-\uA877\uA8CE\uA8CF\uA8F8-\uA8FA\uA8FC\uA92E\uA92F\uA95F\uA9C1-\uA9CD\uA9DE\uA9DF\uAA5C-\uAA5F\uAADE\uAADF\uAAF0\uAAF1\uABEB\uFD3E\uFD3F\uFE10-\uFE19\uFE30-\uFE52\uFE54-\uFE61\uFE63\uFE68\uFE6A\uFE6B\uFF01-\uFF03\uFF05-\uFF0A\uFF0C-\uFF0F\uFF1A\uFF1B\uFF1F\uFF20\uFF3B-\uFF3D\uFF3F\uFF5B\uFF5D\uFF5F-\uFF65]|\uD800[\uDD00-\uDD02\uDF9F\uDFD0]|\uD801\uDD6F|\uD802[\uDC57\uDD1F\uDD3F\uDE50-\uDE58\uDE7F\uDEF0-\uDEF6\uDF39-\uDF3F\uDF99-\uDF9C]|\uD804[\uDC47-\uDC4D\uDCBB\uDCBC\uDCBE-\uDCC1\uDD40-\uDD43\uDD74\uDD75\uDDC5-\uDDC9\uDDCD\uDDDB\uDDDD-\uDDDF\uDE38-\uDE3D\uDEA9]|\uD805[\uDCC6\uDDC1-\uDDD7\uDE41-\uDE43\uDF3C-\uDF3E]|\uD809[\uDC70-\uDC74]|\uD81A[\uDE6E\uDE6F\uDEF5\uDF37-\uDF3B\uDF44]|\uD82F\uDC9F|\uD836[\uDE87-\uDE8B])$/);
      var lineGrammar = exports.lineGrammar = {
        TMH1: {
          regexp: /^( {0,3}#\s)(.*?)((?:\s+#+\s*)?)$/,
          replacement: '<span class="TMMark TMMark_TMH1">$1</span>$$2<span class="TMMark TMMark_TMH1">$3</span>'
        },
        TMH2: {
          regexp: /^( {0,3}##\s)(.*?)((?:\s+#+\s*)?)$/,
          replacement: '<span class="TMMark TMMark_TMH2">$1</span>$$2<span class="TMMark TMMark_TMH2">$3</span>'
        },
        TMH3: {
          regexp: /^( {0,3}###\s)(.*?)((?:\s+#+\s*)?)$/,
          replacement: '<span class="TMMark TMMark_TMH3">$1</span>$$2<span class="TMMark TMMark_TMH3">$3</span>'
        },
        TMH4: {
          regexp: /^( {0,3}####\s)(.*?)((?:\s+#+\s*)?)$/,
          replacement: '<span class="TMMark TMMark_TMH4">$1</span>$$2<span class="TMMark TMMark_TMH4">$3</span>'
        },
        TMH5: {
          regexp: /^( {0,3}#####\s)(.*?)((?:\s+#+\s*)?)$/,
          replacement: '<span class="TMMark TMMark_TMH5">$1</span>$$2<span class="TMMark TMMark_TMH5">$3</span>'
        },
        TMH6: {
          regexp: /^( {0,3}######\s)(.*?)((?:\s+#+\s*)?)$/,
          replacement: '<span class="TMMark TMMark_TMH6">$1</span>$$2<span class="TMMark TMMark_TMH6">$3</span>'
        },
        TMBlockquote: {
          regexp: /^( {0,3}>[ ]?)(.*)$/,
          replacement: '<span class="TMMark TMMark_TMBlockquote">$1</span>$$2'
        },
        TMCodeFenceBacktickOpen: {
          regexp: /^( {0,3}(?<seq>````*)\s*)([^`]*?)(\s*)$/,
          replacement: '<span class="TMMark TMMark_TMCodeFenceBacktick">$1</span><span class="TMInfoString">$3</span>$4'
        },
        TMCodeFenceTildeOpen: {
          regexp: /^( {0,3}(?<seq>~~~~*)\s*)(.*?)(\s*)$/,
          replacement: '<span class="TMMark TMMark_TMCodeFenceTilde">$1</span><span class="TMInfoString">$3</span>$4'
        },
        TMCodeFenceBacktickClose: {
          regexp: /^( {0,3}(?<seq>````*))(\s*)$/,
          replacement: '<span class="TMMark TMMark_TMCodeFenceBacktick">$1</span>$3'
        },
        TMCodeFenceTildeClose: {
          regexp: /^( {0,3}(?<seq>~~~~*))(\s*)$/,
          replacement: '<span class="TMMark TMMark_TMCodeFenceTilde">$1</span>$3'
        },
        TMBlankLine: {
          regexp: /^([ \t]*)$/,
          replacement: "$0"
        },
        TMSetextH1Marker: {
          regexp: /^ {0,3}=+\s*$/,
          replacement: '<span class="TMMark TMMark_TMSetextH1Marker">$0</span>'
        },
        TMSetextH2Marker: {
          regexp: /^ {0,3}-+\s*$/,
          replacement: '<span class="TMMark TMMark_TMSetextH1Marker">$0</span>'
        },
        TMHR: {
          regexp: /^( {0,3}(\*[ \t]*\*[ \t]*\*[ \t*]*)|(-[ \t]*-[ \t]*-[ \t-]*)|(_[ \t]*_[ \t]*_[ \t_]*))$/,
          replacement: '<span class="TMMark TMMark_TMHR">$0</span>'
        },
        TMUL: {
          regexp: /^( {0,3}[+*-] {1,4})(.*)$/,
          replacement: '<span class="TMMark TMMark_TMUL">$1</span>$$2'
        },
        TMOL: {
          regexp: /^( {0,3}\d{1,9}[.)] {1,4})(.*)$/,
          replacement: '<span class="TMMark TMMark_TMOL">$1</span>$$2'
        },
        // TODO: This is currently preventing sublists (and any content within list items, really) from working
        TMIndentedCode: {
          regexp: /^( {4}|\t)(.*)$/,
          replacement: '<span class="TMMark TMMark_TMIndentedCode">$1</span>$2'
        },
        TMLinkReferenceDefinition: {
          // TODO: Link destination can't include unbalanced parantheses, but we just ignore that here 
          regexp: /^( {0,3}\[\s*)([^\s\]](?:[^\]]|\\\])*?)(\s*\]:\s*)((?:[^\s<>]+)|(?:<(?:[^<>\\]|\\.)*>))?(\s*)((?:\((?:[^()\\]|\\.)*\))|(?:"(?:[^"\\]|\\.)*")|(?:'(?:[^'\\]|\\.)*'))?(\s*)$/,
          replacement: '<span class="TMMark TMMark_TMLinkReferenceDefinition">$1</span><span class="TMLinkLabel TMLinkLabel_Definition">$2</span><span class="TMMark TMMark_TMLinkReferenceDefinition">$3</span><span class="TMLinkDestination">$4</span>$5<span class="TMLinkTitle">$6</span>$7',
          labelPlaceholder: 2
          // this defines which placeholder in the above regex is the link "label"
        }
      };
      var htmlBlockGrammar = exports.htmlBlockGrammar = [{
        start: /^ {0,3}<(?:script|pre|style)(?:\s|>|$)/i,
        end: /(?:<\/script>|<\/pre>|<\/style>)/i,
        paraInterrupt: true
      }, {
        start: /^ {0,3}<!--/,
        end: /-->/,
        paraInterrupt: true
      }, {
        start: /^ {0,3}<\?/,
        end: /\?>/,
        paraInterrupt: true
      }, {
        start: /^ {0,3}<![A-Z]/,
        end: />/,
        paraInterrupt: true
      }, {
        start: /^ {0,3}<!\[CDATA\[/,
        end: /\]\]>/,
        paraInterrupt: true
      }, {
        start: /^ {0,3}(?:<|<\/)(?:KnownTag)(?:\s|>|\/>|$)/i,
        end: false,
        paraInterrupt: true
      }, {
        start: /^ {0,3}(?:HTMLOpenTag|HTMLCloseTag)\s*$/,
        end: false,
        paraInterrupt: false
      }];
      var inlineGrammar = exports.inlineGrammar = {
        escape: {
          regexp: /^\\(ASCIIPunctuation)/,
          replacement: '<span class="TMMark TMMark_TMEscape">\\</span>$1'
        },
        code: {
          regexp: /^(`+)((?:[^`])|(?:[^`].*?[^`]))(\1)/,
          replacement: '<span class="TMMark TMMark_TMCode">$1</span><code class="TMCode">$2</code><span class="TMMark TMMark_TMCode">$3</span>'
        },
        autolink: {
          regexp: /^<((?:Scheme:[^\s<>]*)|(?:Email))>/,
          replacement: '<span class="TMMark TMMark_TMAutolink">&lt;</span><span class="TMAutolink">$1</span><span class="TMMark TMMark_TMAutolink">&gt;</span>'
        },
        html: {
          regexp: /^((?:HTMLOpenTag)|(?:HTMLCloseTag)|(?:HTMLComment)|(?:HTMLPI)|(?:HTMLDeclaration)|(?:HTMLCDATA))/,
          replacement: '<span class="TMHTML">$1</span>'
        },
        linkOpen: {
          regexp: /^\[/,
          replacement: ""
        },
        imageOpen: {
          regexp: /^!\[/,
          replacement: ""
        },
        linkLabel: {
          regexp: /^(\[\s*)([^\]]*?)(\s*\])/,
          replacement: "",
          labelPlaceholder: 2
        },
        default: {
          regexp: /^(.|(?:NotTriggerChar+))/,
          replacement: "$1"
        }
      };
      var replacementRegexp = new RegExp(Object.keys(replacements).join("|"));
      var inlineRules = [...Object.keys(inlineGrammar)];
      for (let rule of inlineRules) {
        let re = inlineGrammar[rule].regexp.source;
        while (re.match(replacementRegexp)) {
          re = re.replace(replacementRegexp, (string) => {
            return replacements[string].source;
          });
        }
        inlineGrammar[rule].regexp = new RegExp(re, inlineGrammar[rule].regexp.flags);
      }
      for (let rule of htmlBlockGrammar) {
        let re = rule.start.source;
        while (re.match(replacementRegexp)) {
          re = re.replace(replacementRegexp, (string) => {
            return replacements[string].source;
          });
        }
        rule.start = new RegExp(re, rule.start.flags);
      }
      function htmlescape(string) {
        return (string ? string : "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
      }
      var commands = exports.commands = {
        // Replacements for unset for inline commands are '' by default
        bold: {
          type: "inline",
          className: "TMStrong",
          set: {
            pre: "**",
            post: "**"
          },
          unset: {
            prePattern: /(?:\*\*|__)$/,
            postPattern: /^(?:\*\*|__)/
          }
        },
        italic: {
          type: "inline",
          className: "TMEm",
          set: {
            pre: "*",
            post: "*"
          },
          unset: {
            prePattern: /(?:\*|_)$/,
            postPattern: /^(?:\*|_)/
          }
        },
        code: {
          type: "inline",
          className: "TMCode",
          set: {
            pre: "`",
            post: "`"
          },
          unset: {
            prePattern: /`+$/,
            postPattern: /^`+/
          }
          // FIXME this doesn't ensure balanced backticks right now
        },
        strikethrough: {
          type: "inline",
          className: "TMStrikethrough",
          set: {
            pre: "~~",
            post: "~~"
          },
          unset: {
            prePattern: /~~$/,
            postPattern: /^~~/
          }
        },
        h1: {
          type: "line",
          className: "TMH1",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "# $2"
          },
          unset: {
            pattern: /^( {0,3}#\s+)(.*?)((?:\s+#+\s*)?)$/,
            replacement: "$2"
          }
        },
        h2: {
          type: "line",
          className: "TMH2",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "## $2"
          },
          unset: {
            pattern: /^( {0,3}##\s+)(.*?)((?:\s+#+\s*)?)$/,
            replacement: "$2"
          }
        },
        h3: {
          type: "line",
          className: "TMH3",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "### $2"
          },
          unset: {
            pattern: /^( {0,3}###\s+)(.*?)((?:\s+#+\s*)?)$/,
            replacement: "$2"
          }
        },
        h4: {
          type: "line",
          className: "TMH4",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "#### $2"
          },
          unset: {
            pattern: /^( {0,3}####\s+)(.*?)((?:\s+#+\s*)?)$/,
            replacement: "$2"
          }
        },
        h5: {
          type: "line",
          className: "TMH5",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "##### $2"
          },
          unset: {
            pattern: /^( {0,3}#####\s+)(.*?)((?:\s+#+\s*)?)$/,
            replacement: "$2"
          }
        },
        h6: {
          type: "line",
          className: "TMH6",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "###### $2"
          },
          unset: {
            pattern: /^( {0,3}######\s+)(.*?)((?:\s+#+\s*)?)$/,
            replacement: "$2"
          }
        },
        ul: {
          type: "line",
          className: "TMUL",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "- $2"
          },
          unset: {
            pattern: /^( {0,3}[+*-] {1,4})(.*)$/,
            replacement: "$2"
          }
        },
        ol: {
          type: "line",
          className: "TMOL",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "$#. $2"
          },
          unset: {
            pattern: /^( {0,3}\d{1,9}[.)] {1,4})(.*)$/,
            replacement: "$2"
          }
        },
        blockquote: {
          type: "line",
          className: "TMBlockquote",
          set: {
            pattern: /^( {0,3}(?:(?:#+|[0-9]{1,9}[).]|[>\-*+])\s+)?)(.*)$/,
            replacement: "> $2"
          },
          unset: {
            pattern: /^( {0,3}>[ ]?)(.*)$/,
            replacement: "$2"
          }
        }
      };
    }
  });

  // node_modules/tiny-markdown-editor/lib/TinyMDE.js
  var require_TinyMDE = __commonJS({
    "node_modules/tiny-markdown-editor/lib/TinyMDE.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", {
        value: true
      });
      exports.default = void 0;
      var _grammar = require_grammar();
      var Editor = class {
        constructor() {
          let props = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {};
          this.e = null;
          this.textarea = null;
          this.lines = [];
          this.lineElements = [];
          this.lineTypes = [];
          this.lineCaptures = [];
          this.lineReplacements = [];
          this.linkLabels = [];
          this.lineDirty = [];
          this.lastCommandState = null;
          this.listeners = {
            change: [],
            selection: []
          };
          let element = props.element;
          this.textarea = props.textarea;
          if (this.textarea && !this.textarea.tagName) {
            this.textarea = document.getElementById(this.textarea);
            if (!element)
              element = this.textarea;
          }
          if (element && !element.tagName) {
            element = document.getElementById(props.element);
          }
          if (!element) {
            element = document.getElementsByTagName("body")[0];
          }
          if (element.tagName == "TEXTAREA") {
            this.textarea = element;
            element = this.textarea.parentNode;
          }
          if (this.textarea) {
            this.textarea.style.display = "none";
          }
          this.createEditorElement(element);
          this.setContent(props.content || (this.textarea ? this.textarea.value : false) || "# Hello TinyMDE!\nEdit **here**");
        }
        /**
         * Creates the editor element inside the target element of the DOM tree
         * @param element The target element of the DOM tree
         */
        createEditorElement(element) {
          this.e = document.createElement("div");
          this.e.className = "TinyMDE";
          this.e.contentEditable = true;
          this.e.style.whiteSpace = "pre-wrap";
          this.e.style.webkitUserModify = "read-write-plaintext-only";
          if (this.textarea && this.textarea.parentNode == element && this.textarea.nextSibling) {
            element.insertBefore(this.e, this.textarea.nextSibling);
          } else {
            element.appendChild(this.e);
          }
          this.e.addEventListener("input", (e) => this.handleInputEvent(e));
          document.addEventListener("selectionchange", (e) => this.handleSelectionChangeEvent(e));
          this.e.addEventListener("paste", (e) => this.handlePaste(e));
          this.lineElements = this.e.childNodes;
        }
        /**
         * Sets the editor content.
         * @param {string} content The new Markdown content
         */
        setContent(content) {
          while (this.e.firstChild) {
            this.e.removeChild(this.e.firstChild);
          }
          this.lines = content.split(/(?:\r\n|\r|\n)/);
          this.lineDirty = [];
          for (let lineNum = 0; lineNum < this.lines.length; lineNum++) {
            let le = document.createElement("div");
            this.e.appendChild(le);
            this.lineDirty.push(true);
          }
          this.lineTypes = new Array(this.lines.length);
          this.updateFormatting();
          this.fireChange();
        }
        /**
         * Gets the editor content as a Markdown string.
         * @returns {string} The editor content as a markdown string
         */
        getContent() {
          return this.lines.join("\n");
        }
        /**
         * This is the main method to update the formatting (from this.lines to HTML output)
         */
        updateFormatting() {
          this.updateLineTypes();
          this.updateLinkLabels();
          this.applyLineTypes();
        }
        /**
         * Updates this.linkLabels: For every link reference definition (line type TMLinkReferenceDefinition), we collect the label
         */
        updateLinkLabels() {
          this.linkLabels = [];
          for (let l = 0; l < this.lines.length; l++) {
            if (this.lineTypes[l] == "TMLinkReferenceDefinition") {
              this.linkLabels.push(this.lineCaptures[l][_grammar.lineGrammar.TMLinkReferenceDefinition.labelPlaceholder]);
            }
          }
        }
        /**
         * Helper function to replace placeholders from a RegExp capture. The replacement string can contain regular dollar placeholders (e.g., $1),
         * which are interpreted like in String.replace(), but also double dollar placeholders ($$1). In the case of double dollar placeholders, 
         * Markdown inline grammar is applied on the content of the captured subgroup, i.e., $$1 processes inline Markdown grammar in the content of the
         * first captured subgroup, and replaces `$$1` with the result.
         * 
         * @param {string} replacement The replacement string, including placeholders.
         * @param  capture The result of a RegExp.exec() call
         * @returns The replacement string, with placeholders replaced from the capture result.
         */
        replace(replacement, capture) {
          return replacement.replace(/(\${1,2})([0-9])/g, (str, p1, p2) => {
            if (p1 == "$")
              return (0, _grammar.htmlescape)(capture[p2]);
            else
              return `<span class="TMInlineFormatted">${this.processInlineStyles(capture[p2])}</span>`;
          });
        }
        /**
         * Applies the line types (from this.lineTypes as well as the capture result in this.lineReplacements and this.lineCaptures) 
         * and processes inline formatting for all lines.
         */
        applyLineTypes() {
          for (let lineNum = 0; lineNum < this.lines.length; lineNum++) {
            if (this.lineDirty[lineNum]) {
              let contentHTML = this.replace(this.lineReplacements[lineNum], this.lineCaptures[lineNum]);
              this.lineElements[lineNum].className = this.lineTypes[lineNum];
              this.lineElements[lineNum].removeAttribute("style");
              this.lineElements[lineNum].innerHTML = contentHTML == "" ? "<br />" : contentHTML;
            }
            this.lineElements[lineNum].dataset.lineNum = lineNum;
          }
        }
        /**
         * Determines line types for all lines based on the line / block grammar. Captures the results of the respective line
         * grammar regular expressions.
         * Updates this.lineTypes, this.lineCaptures, and this.lineReplacements.
         */
        updateLineTypes() {
          let codeBlockType = false;
          let codeBlockSeqLength = 0;
          let htmlBlock = false;
          for (let lineNum = 0; lineNum < this.lines.length; lineNum++) {
            let lineType = "TMPara";
            let lineCapture = [this.lines[lineNum]];
            let lineReplacement = "$$0";
            if (codeBlockType == "TMCodeFenceBacktickOpen") {
              let capture = _grammar.lineGrammar.TMCodeFenceBacktickClose.regexp.exec(this.lines[lineNum]);
              if (capture && capture.groups["seq"].length >= codeBlockSeqLength) {
                lineType = "TMCodeFenceBacktickClose";
                lineReplacement = _grammar.lineGrammar.TMCodeFenceBacktickClose.replacement;
                lineCapture = capture;
                codeBlockType = false;
              } else {
                lineType = "TMFencedCodeBacktick";
                lineReplacement = "$0";
                lineCapture = [this.lines[lineNum]];
              }
            } else if (codeBlockType == "TMCodeFenceTildeOpen") {
              let capture = _grammar.lineGrammar.TMCodeFenceTildeClose.regexp.exec(this.lines[lineNum]);
              if (capture && capture.groups["seq"].length >= codeBlockSeqLength) {
                lineType = "TMCodeFenceTildeClose";
                lineReplacement = _grammar.lineGrammar.TMCodeFenceTildeClose.replacement;
                lineCapture = capture;
                codeBlockType = false;
              } else {
                lineType = "TMFencedCodeTilde";
                lineReplacement = "$0";
                lineCapture = [this.lines[lineNum]];
              }
            }
            if (lineType == "TMPara" && htmlBlock === false) {
              for (let htmlBlockType of _grammar.htmlBlockGrammar) {
                if (this.lines[lineNum].match(htmlBlockType.start)) {
                  if (htmlBlockType.paraInterrupt || lineNum == 0 || !(this.lineTypes[lineNum - 1] == "TMPara" || this.lineTypes[lineNum - 1] == "TMUL" || this.lineTypes[lineNum - 1] == "TMOL" || this.lineTypes[lineNum - 1] == "TMBlockquote")) {
                    htmlBlock = htmlBlockType;
                    break;
                  }
                }
              }
            }
            if (htmlBlock !== false) {
              lineType = "TMHTMLBlock";
              lineReplacement = "$0";
              lineCapture = [this.lines[lineNum]];
              if (htmlBlock.end) {
                if (this.lines[lineNum].match(htmlBlock.end)) {
                  htmlBlock = false;
                }
              } else {
                if (lineNum == this.lines.length - 1 || this.lines[lineNum + 1].match(_grammar.lineGrammar.TMBlankLine.regexp)) {
                  htmlBlock = false;
                }
              }
            }
            if (lineType == "TMPara") {
              for (let type in _grammar.lineGrammar) {
                if (_grammar.lineGrammar[type].regexp) {
                  let capture = _grammar.lineGrammar[type].regexp.exec(this.lines[lineNum]);
                  if (capture) {
                    lineType = type;
                    lineReplacement = _grammar.lineGrammar[type].replacement;
                    lineCapture = capture;
                    break;
                  }
                }
              }
            }
            if (lineType == "TMCodeFenceBacktickOpen" || lineType == "TMCodeFenceTildeOpen") {
              codeBlockType = lineType;
              codeBlockSeqLength = lineCapture.groups["seq"].length;
            }
            if ((lineType == "TMIndentedCode" || lineType == "TMLinkReferenceDefinition") && lineNum > 0 && (this.lineTypes[lineNum - 1] == "TMPara" || this.lineTypes[lineNum - 1] == "TMUL" || this.lineTypes[lineNum - 1] == "TMOL" || this.lineTypes[lineNum - 1] == "TMBlockquote")) {
              lineType = "TMPara";
              lineCapture = [this.lines[lineNum]];
              lineReplacement = "$$0";
            }
            if (lineType == "TMSetextH2Marker") {
              let capture = _grammar.lineGrammar.TMUL.regexp.exec(this.lines[lineNum]);
              if (capture) {
                lineType = "TMUL";
                lineReplacement = _grammar.lineGrammar.TMUL.replacement;
                lineCapture = capture;
              }
            }
            if (lineType == "TMSetextH1Marker" || lineType == "TMSetextH2Marker") {
              if (lineNum == 0 || this.lineTypes[lineNum - 1] != "TMPara") {
                let capture = _grammar.lineGrammar.TMHR.regexp.exec(this.lines[lineNum]);
                if (capture) {
                  lineType = "TMHR";
                  lineCapture = capture;
                  lineReplacement = _grammar.lineGrammar.TMHR.replacement;
                } else {
                  lineType = "TMPara";
                  lineCapture = [this.lines[lineNum]];
                  lineReplacement = "$$0";
                }
              } else {
                let headingLine = lineNum - 1;
                const headingLineType = lineType == "TMSetextH1Marker" ? "TMSetextH1" : "TMSetextH2";
                do {
                  if (this.lineTypes[headingLineType] != headingLineType) {
                    this.lineTypes[headingLine] = headingLineType;
                    this.lineDirty[headingLineType] = true;
                  }
                  this.lineReplacements[headingLine] = "$$0";
                  this.lineCaptures[headingLine] = [this.lines[headingLine]];
                  headingLine--;
                } while (headingLine >= 0 && this.lineTypes[headingLine] == "TMPara");
              }
            }
            if (this.lineTypes[lineNum] != lineType) {
              this.lineTypes[lineNum] = lineType;
              this.lineDirty[lineNum] = true;
            }
            this.lineReplacements[lineNum] = lineReplacement;
            this.lineCaptures[lineNum] = lineCapture;
          }
        }
        /**
         * Updates all line contents from the HTML, then re-applies formatting.
         */
        updateLineContentsAndFormatting() {
          this.clearDirtyFlag();
          this.updateLineContents();
          this.updateFormatting();
        }
        /**
         * Attempts to parse a link or image at the current position. This assumes that the opening [ or ![ has already been matched. 
         * Returns false if this is not a valid link, image. See below for more information
         * @param {string} originalString The original string, starting at the opening marker ([ or ![)
         * @param {boolean} isImage Whether or not this is an image (opener == ![)
         * @returns false if not a valid link / image. 
         * Otherwise returns an object with two properties: output is the string to be included in the processed output, 
         * charCount is the number of input characters (from originalString) consumed.
         */
        parseLinkOrImage(originalString, isImage) {
          let textOffset = isImage ? 2 : 1;
          let opener = originalString.substr(0, textOffset);
          let type = isImage ? "TMImage" : "TMLink";
          let currentOffset = textOffset;
          let bracketLevel = 1;
          let linkText = false;
          let linkRef = false;
          let linkLabel = [];
          let linkDetails = [];
          textOuter:
            while (currentOffset < originalString.length && linkText === false) {
              let string = originalString.substr(currentOffset);
              for (let rule of ["escape", "code", "autolink", "html"]) {
                let cap = _grammar.inlineGrammar[rule].regexp.exec(string);
                if (cap) {
                  currentOffset += cap[0].length;
                  continue textOuter;
                }
              }
              if (string.match(_grammar.inlineGrammar.imageOpen.regexp)) {
                bracketLevel++;
                currentOffset += 2;
                continue textOuter;
              }
              if (string.match(_grammar.inlineGrammar.linkOpen.regexp)) {
                bracketLevel++;
                if (!isImage) {
                  if (this.parseLinkOrImage(string, false)) {
                    return false;
                  }
                }
                currentOffset += 1;
                continue textOuter;
              }
              if (string.match(/^\]/)) {
                bracketLevel--;
                if (bracketLevel == 0) {
                  linkText = originalString.substr(textOffset, currentOffset - textOffset);
                  currentOffset++;
                  continue textOuter;
                }
              }
              currentOffset++;
            }
          if (linkText === false)
            return false;
          let nextChar = currentOffset < originalString.length ? originalString.substr(currentOffset, 1) : "";
          if (nextChar == "[") {
            let string = originalString.substr(currentOffset);
            let cap = _grammar.inlineGrammar.linkLabel.regexp.exec(string);
            if (cap) {
              currentOffset += cap[0].length;
              linkLabel.push(cap[1], cap[2], cap[3]);
              if (cap[_grammar.inlineGrammar.linkLabel.labelPlaceholder]) {
                linkRef = cap[_grammar.inlineGrammar.linkLabel.labelPlaceholder];
              } else {
                linkRef = linkText.trim();
              }
            } else {
              return false;
            }
          } else if (nextChar != "(") {
            linkRef = linkText.trim();
          } else {
            currentOffset++;
            let parenthesisLevel = 1;
            inlineOuter:
              while (currentOffset < originalString.length && parenthesisLevel > 0) {
                let string = originalString.substr(currentOffset);
                let cap = /^\s+/.exec(string);
                if (cap) {
                  switch (linkDetails.length) {
                    case 0:
                      linkDetails.push(cap[0]);
                      break;
                    case 1:
                      linkDetails.push(cap[0]);
                      break;
                    case 2:
                      if (linkDetails[0].match(/</)) {
                        linkDetails[1] = linkDetails[1].concat(cap[0]);
                      } else {
                        if (parenthesisLevel != 1)
                          return false;
                        linkDetails.push("");
                        linkDetails.push(cap[0]);
                      }
                      break;
                    case 3:
                      linkDetails.push(cap[0]);
                      break;
                    case 4:
                      return false;
                    case 5:
                      linkDetails.push("");
                    case 6:
                      linkDetails[5] = linkDetails[5].concat(cap[0]);
                      break;
                    case 7:
                      linkDetails[6] = linkDetails[6].concat(cap[0]);
                      break;
                    default:
                      return false;
                  }
                  currentOffset += cap[0].length;
                  continue inlineOuter;
                }
                cap = _grammar.inlineGrammar.escape.regexp.exec(string);
                if (cap) {
                  switch (linkDetails.length) {
                    case 0:
                      linkDetails.push("");
                    case 1:
                      linkDetails.push(cap[0]);
                      break;
                    case 2:
                      linkDetails[1] = linkDetails[1].concat(cap[0]);
                      break;
                    case 3:
                      return false;
                    case 4:
                      return false;
                    case 5:
                      linkDetails.push("");
                    case 6:
                      linkDetails[5] = linkDetails[5].concat(cap[0]);
                      break;
                    default:
                      return false;
                  }
                  currentOffset += cap[0].length;
                  continue inlineOuter;
                }
                if (linkDetails.length < 2 && string.match(/^</)) {
                  if (linkDetails.length == 0)
                    linkDetails.push("");
                  linkDetails[0] = linkDetails[0].concat("<");
                  currentOffset++;
                  continue inlineOuter;
                }
                if ((linkDetails.length == 1 || linkDetails.length == 2) && string.match(/^>/)) {
                  if (linkDetails.length == 1)
                    linkDetails.push("");
                  linkDetails.push(">");
                  currentOffset++;
                  continue inlineOuter;
                }
                cap = /^["']/.exec(string);
                if (cap && (linkDetails.length == 0 || linkDetails.length == 1 || linkDetails.length == 4)) {
                  while (linkDetails.length < 4)
                    linkDetails.push("");
                  linkDetails.push(cap[0]);
                  currentOffset++;
                  continue inlineOuter;
                }
                if (cap && (linkDetails.length == 5 || linkDetails.length == 6) && linkDetails[4] == cap[0]) {
                  if (linkDetails.length == 5)
                    linkDetails.push("");
                  linkDetails.push(cap[0]);
                  currentOffset++;
                  continue inlineOuter;
                }
                if (string.match(/^\(/)) {
                  switch (linkDetails.length) {
                    case 0:
                      linkDetails.push("");
                    case 1:
                      linkDetails.push("");
                    case 2:
                      linkDetails[1] = linkDetails[1].concat("(");
                      if (!linkDetails[0].match(/<$/))
                        parenthesisLevel++;
                      break;
                    case 3:
                      linkDetails.push("");
                    case 4:
                      linkDetails.push("(");
                      break;
                    case 5:
                      linkDetails.push("");
                    case 6:
                      if (linkDetails[4] == "(")
                        return false;
                      linkDetails[5] = linkDetails[5].concat("(");
                      break;
                    default:
                      return false;
                  }
                  currentOffset++;
                  continue inlineOuter;
                }
                if (string.match(/^\)/)) {
                  if (linkDetails.length <= 2) {
                    while (linkDetails.length < 2)
                      linkDetails.push("");
                    if (!linkDetails[0].match(/<$/))
                      parenthesisLevel--;
                    if (parenthesisLevel > 0) {
                      linkDetails[1] = linkDetails[1].concat(")");
                    }
                  } else if (linkDetails.length == 5 || linkDetails.length == 6) {
                    if (linkDetails[4] == "(") {
                      if (linkDetails.length == 5)
                        linkDetails.push("");
                      linkDetails.push(")");
                    } else {
                      if (linkDetails.length == 5)
                        linkDetails.push(")");
                      else
                        linkDetails[5] = linkDetails[5].concat(")");
                    }
                  } else {
                    parenthesisLevel--;
                  }
                  if (parenthesisLevel == 0) {
                    while (linkDetails.length < 7)
                      linkDetails.push("");
                  }
                  currentOffset++;
                  continue inlineOuter;
                }
                cap = /^./.exec(string);
                if (cap) {
                  switch (linkDetails.length) {
                    case 0:
                      linkDetails.push("");
                    case 1:
                      linkDetails.push(cap[0]);
                      break;
                    case 2:
                      linkDetails[1] = linkDetails[1].concat(cap[0]);
                      break;
                    case 3:
                      return false;
                    case 4:
                      return false;
                    case 5:
                      linkDetails.push("");
                    case 6:
                      linkDetails[5] = linkDetails[5].concat(cap[0]);
                      break;
                    default:
                      return false;
                  }
                  currentOffset += cap[0].length;
                  continue inlineOuter;
                }
                throw "Infinite loop";
              }
            if (parenthesisLevel > 0)
              return false;
          }
          if (linkRef !== false) {
            let valid = false;
            for (let label2 of this.linkLabels) {
              if (label2 == linkRef) {
                valid = true;
                break;
              }
            }
            let label = valid ? "TMLinkLabel TMLinkLabel_Valid" : "TMLinkLabel TMLinkLabel_Invalid";
            let output = `<span class="TMMark TMMark_${type}">${opener}</span><span class="${type} ${linkLabel.length < 3 || !linkLabel[1] ? label : ""}">${this.processInlineStyles(linkText)}</span><span class="TMMark TMMark_${type}">]</span>`;
            if (linkLabel.length >= 3) {
              output = output.concat(`<span class="TMMark TMMark_${type}">${linkLabel[0]}</span>`, `<span class="${label}">${linkLabel[1]}</span>`, `<span class="TMMark TMMark_${type}">${linkLabel[2]}</span>`);
            }
            return {
              output,
              charCount: currentOffset
            };
          } else if (linkDetails) {
            while (linkDetails.length < 7) {
              linkDetails.push("");
            }
            return {
              output: `<span class="TMMark TMMark_${type}">${opener}</span><span class="${type}">${this.processInlineStyles(linkText)}</span><span class="TMMark TMMark_${type}">](${linkDetails[0]}</span><span class="${type}Destination">${linkDetails[1]}</span><span class="TMMark TMMark_${type}">${linkDetails[2]}${linkDetails[3]}${linkDetails[4]}</span><span class="${type}Title">${linkDetails[5]}</span><span class="TMMark TMMark_${type}">${linkDetails[6]})</span>`,
              charCount: currentOffset
            };
          }
          return false;
        }
        /**
         * Formats a markdown string as HTML, using Markdown inline formatting.
         * @param {string} originalString The input (markdown inline formatted) string
         * @returns {string} The HTML formatted output
         */
        processInlineStyles(originalString) {
          let processed = "";
          let stack = [];
          let offset = 0;
          let string = originalString;
          outer:
            while (string) {
              for (let rule of ["escape", "code", "autolink", "html"]) {
                let cap2 = _grammar.inlineGrammar[rule].regexp.exec(string);
                if (cap2) {
                  string = string.substr(cap2[0].length);
                  offset += cap2[0].length;
                  processed += _grammar.inlineGrammar[rule].replacement.replace(/\$([1-9])/g, (str, p1) => (0, _grammar.htmlescape)(cap2[p1]));
                  continue outer;
                }
              }
              let potentialLink = string.match(_grammar.inlineGrammar.linkOpen.regexp);
              let potentialImage = string.match(_grammar.inlineGrammar.imageOpen.regexp);
              if (potentialImage || potentialLink) {
                let result = this.parseLinkOrImage(string, potentialImage);
                if (result) {
                  processed = `${processed}${result.output}`;
                  string = string.substr(result.charCount);
                  offset += result.charCount;
                  continue outer;
                }
              }
              let cap = /(^\*+)|(^_+)/.exec(string);
              if (cap) {
                let delimCount = cap[0].length;
                const delimString = cap[0];
                const currentDelimiter = cap[0][0];
                string = string.substr(cap[0].length);
                const preceding = offset > 0 ? originalString.substr(0, offset) : " ";
                const following = offset + cap[0].length < originalString.length ? string : " ";
                const punctuationFollows = following.match(_grammar.punctuationLeading);
                const punctuationPrecedes = preceding.match(_grammar.punctuationTrailing);
                const whitespaceFollows = following.match(/^\s/);
                const whitespacePrecedes = preceding.match(/\s$/);
                let canOpen = !whitespaceFollows && (!punctuationFollows || !!whitespacePrecedes || !!punctuationPrecedes);
                let canClose = !whitespacePrecedes && (!punctuationPrecedes || !!whitespaceFollows || !!punctuationFollows);
                if (currentDelimiter == "_" && canOpen && canClose) {
                  canOpen = punctuationPrecedes;
                  canClose = punctuationFollows;
                }
                if (canClose) {
                  let stackPointer = stack.length - 1;
                  while (delimCount && stackPointer >= 0) {
                    if (stack[stackPointer].delimiter == currentDelimiter) {
                      while (stackPointer < stack.length - 1) {
                        const entry = stack.pop();
                        processed = `${entry.output}${entry.delimString.substr(0, entry.count)}${processed}`;
                      }
                      if (delimCount >= 2 && stack[stackPointer].count >= 2) {
                        processed = `<span class="TMMark">${currentDelimiter}${currentDelimiter}</span><strong class="TMStrong">${processed}</strong><span class="TMMark">${currentDelimiter}${currentDelimiter}</span>`;
                        delimCount -= 2;
                        stack[stackPointer].count -= 2;
                      } else {
                        processed = `<span class="TMMark">${currentDelimiter}</span><em class="TMEm">${processed}</em><span class="TMMark">${currentDelimiter}</span>`;
                        delimCount -= 1;
                        stack[stackPointer].count -= 1;
                      }
                      if (stack[stackPointer].count == 0) {
                        let entry = stack.pop();
                        processed = `${entry.output}${processed}`;
                        stackPointer--;
                      }
                    } else {
                      stackPointer--;
                    }
                  }
                }
                if (delimCount && canOpen) {
                  stack.push({
                    delimiter: currentDelimiter,
                    delimString,
                    count: delimCount,
                    output: processed
                  });
                  processed = "";
                  delimCount = 0;
                }
                if (delimCount) {
                  processed = `${processed}${delimString.substr(0, delimCount)}`;
                }
                offset += cap[0].length;
                continue outer;
              }
              cap = /^~~/.exec(string);
              if (cap) {
                let consumed = false;
                let stackPointer = stack.length - 1;
                while (!consumed && stackPointer >= 0) {
                  if (stack[stackPointer].delimiter == "~") {
                    while (stackPointer < stack.length - 1) {
                      const entry2 = stack.pop();
                      processed = `${entry2.output}${entry2.delimString.substr(0, entry2.count)}${processed}`;
                    }
                    processed = `<span class="TMMark">~~</span><del class="TMStrikethrough">${processed}</del><span class="TMMark">~~</span>`;
                    let entry = stack.pop();
                    processed = `${entry.output}${processed}`;
                    consumed = true;
                  } else {
                    stackPointer--;
                  }
                }
                if (!consumed) {
                  stack.push({
                    delimiter: "~",
                    delimString: "~~",
                    count: 2,
                    output: processed
                  });
                  processed = "";
                }
                offset += cap[0].length;
                string = string.substr(cap[0].length);
                continue outer;
              }
              cap = _grammar.inlineGrammar.default.regexp.exec(string);
              if (cap) {
                string = string.substr(cap[0].length);
                offset += cap[0].length;
                processed += _grammar.inlineGrammar.default.replacement.replace(/\$([1-9])/g, (str, p1) => (0, _grammar.htmlescape)(cap[p1]));
                continue outer;
              }
              throw "Infinite loop!";
            }
          while (stack.length) {
            const entry = stack.pop();
            processed = `${entry.output}${entry.delimString.substr(0, entry.count)}${processed}`;
          }
          return processed;
        }
        /** 
         * Clears the line dirty flag (resets it to an array of false)
         */
        clearDirtyFlag() {
          this.lineDirty = new Array(this.lines.length);
          for (let i = 0; i < this.lineDirty.length; i++) {
            this.lineDirty[i] = false;
          }
        }
        /**
         * Updates the class properties (lines, lineElements) from the DOM.
         * @returns true if contents changed
         */
        updateLineContents() {
          let lineDelta = this.e.childElementCount - this.lines.length;
          if (lineDelta) {
            let firstChangedLine = 0;
            while (firstChangedLine <= this.lines.length && firstChangedLine <= this.lineElements.length && this.lineElements[firstChangedLine] && this.lines[firstChangedLine] == this.lineElements[firstChangedLine].textContent) {
              firstChangedLine++;
            }
            let lastChangedLine = -1;
            while (-lastChangedLine < this.lines.length && -lastChangedLine < this.lineElements.length && this.lines[this.lines.length + lastChangedLine] == this.lineElements[this.lineElements.length + lastChangedLine].textContent) {
              lastChangedLine--;
            }
            let linesToDelete = this.lines.length + lastChangedLine + 1 - firstChangedLine;
            if (linesToDelete < -lineDelta)
              linesToDelete = -lineDelta;
            if (linesToDelete < 0)
              linesToDelete = 0;
            let linesToAdd = [];
            for (let l = 0; l < linesToDelete + lineDelta; l++) {
              linesToAdd.push(this.lineElements[firstChangedLine + l].textContent);
            }
            this.spliceLines(firstChangedLine, linesToDelete, linesToAdd, false);
          } else {
            for (let line = 0; line < this.lineElements.length; line++) {
              let e = this.lineElements[line];
              let ct = e.textContent;
              if (this.lines[line] !== ct) {
                this.lines[line] = ct;
                this.lineDirty[line] = true;
              }
            }
          }
        }
        /**
         * Processes a new paragraph.
         * @param sel The current selection
         */
        processNewParagraph(sel) {
          if (!sel)
            return;
          this.updateLineContents();
          let continuableType = false;
          let checkLine = sel.col > 0 ? sel.row : sel.row - 1;
          switch (this.lineTypes[checkLine]) {
            case "TMUL":
              continuableType = "TMUL";
              break;
            case "TMOL":
              continuableType = "TMOL";
              break;
            case "TMIndentedCode":
              continuableType = "TMIndentedCode";
              break;
          }
          let lines = this.lines[sel.row].replace(/\n\n$/, "\n").split(/(?:\r\n|\n|\r)/);
          if (lines.length == 1) {
            this.updateFormatting();
            return;
          }
          this.spliceLines(sel.row, 1, lines, true);
          sel.row++;
          sel.col = 0;
          if (continuableType) {
            let capture = _grammar.lineGrammar[continuableType].regexp.exec(this.lines[sel.row - 1]);
            if (capture) {
              if (capture[2]) {
                if (continuableType == "TMOL") {
                  capture[1] = capture[1].replace(/\d{1,9}/, (result) => {
                    return parseInt(result[0]) + 1;
                  });
                }
                this.lines[sel.row] = `${capture[1]}${this.lines[sel.row]}`;
                this.lineDirty[sel.row] = true;
                sel.col = capture[1].length;
              } else {
                this.lines[sel.row - 1] = "";
                this.lineDirty[sel.row - 1] = true;
              }
            }
          }
          this.updateFormatting();
        }
        // /**
        //  * Processes a "delete" input action.
        //  * @param {object} focus The selection
        //  * @param {boolean} forward If true, performs a forward delete, otherwise performs a backward delete
        //  */
        // processDelete(focus, forward) {
        //   if (!focus) return;
        //   let anchor = this.getSelection(true);
        //   // Do we have a non-empty selection? 
        //   if (focus.col != anchor.col || focus.row != anchor.row) {
        //     // non-empty. direction doesn't matter.
        //     this.paste('', anchor, focus);
        //   } else {
        //     if (forward) {
        //       if (focus.col < this.lines[focus.row].length) this.paste('', {row: focus.row, col: focus.col + 1}, focus);
        //       else if (focus.col < this.lines.length) this.paste('', {row: focus.row + 1, col: 0}, focus);
        //       // Otherwise, we're at the very end and can't delete forward
        //     } else {
        //       if (focus.col > 0) this.paste('', {row: focus.row, col: focus.col - 1}, focus);
        //       else if (focus.row > 0) this.paste('', {row: focus.row - 1, col: this.lines[focus.row - 1].length - 1}, focus);
        //       // Otherwise, we're at the very beginning and can't delete backwards
        //     }
        //   }
        // }
        /**
         * Gets the current position of the selection counted by row and column of the editor Markdown content (as opposed to the position in the DOM).
         * 
         * @param {boolean} getAnchor if set to true, gets the selection anchor (start point of the selection), otherwise gets the focus (end point).
         * @return {object} An object representing the selection, with properties col and row.
         */
        getSelection() {
          let getAnchor = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : false;
          const selection = window.getSelection();
          let startNode = getAnchor ? selection.anchorNode : selection.focusNode;
          if (!startNode)
            return null;
          let offset = startNode.nodeType === Node.TEXT_NODE ? getAnchor ? selection.anchorOffset : selection.focusOffset : 0;
          if (startNode == this.e) {
            return {
              row: 0,
              col: offset
            };
          }
          let col = this.computeColumn(startNode, offset);
          if (col === null)
            return null;
          let node = startNode;
          while (node.parentElement != this.e) {
            node = node.parentElement;
          }
          let row = 0;
          if (node.dataset && node.dataset.lineNum && (!node.previousSibling || node.previousSibling.dataset.lineNum != node.dataset.lineNum)) {
            row = parseInt(node.dataset.lineNum);
          } else {
            while (node.previousSibling) {
              row++;
              node = node.previousSibling;
            }
          }
          return {
            row,
            col,
            node: startNode
          };
        }
        /**
         * Computes a column within an editor line from a node and offset within that node.
         * @param {Node} startNode The node
         * @param {int} offset THe selection
         * @returns {int} the column, or null if the node is not inside the editor
         */
        computeColumn(startNode, offset) {
          let node = startNode;
          let col = offset;
          while (node && node.parentNode != this.e) {
            node = node.parentNode;
          }
          if (node == null)
            return null;
          node = startNode;
          while (node.parentNode != this.e) {
            if (node.previousSibling) {
              node = node.previousSibling;
              col += node.textContent.length;
            } else {
              node = node.parentNode;
            }
          }
          return col;
        }
        /**
         * Computes DOM node and offset within that node from a position expressed as row and column.
         * @param {int} row Row (line number)
         * @param {int} col Column
         * @returns An object with two properties: node and offset. offset may be null;
         */
        computeNodeAndOffset(row, col) {
          let bindRight = arguments.length > 2 && arguments[2] !== void 0 ? arguments[2] : false;
          if (row >= this.lineElements.length) {
            row = this.lineElements.length - 1;
            col = this.lines[row].length;
          }
          if (col > this.lines[row].length) {
            col = this.lines[row].length;
          }
          const parentNode = this.lineElements[row];
          let node = parentNode.firstChild;
          let childrenComplete = false;
          let rv = {
            node: parentNode.firstChild ? parentNode.firstChild : parentNode,
            offset: 0
          };
          while (node != parentNode) {
            if (!childrenComplete && node.nodeType === Node.TEXT_NODE) {
              if (node.nodeValue.length >= col) {
                if (bindRight && node.nodeValue.length == col) {
                  rv = {
                    node,
                    offset: col
                  };
                  col = 0;
                } else {
                  return {
                    node,
                    offset: col
                  };
                }
              } else {
                col -= node.nodeValue.length;
              }
            }
            if (!childrenComplete && node.firstChild) {
              node = node.firstChild;
            } else if (node.nextSibling) {
              childrenComplete = false;
              node = node.nextSibling;
            } else {
              childrenComplete = true;
              node = node.parentNode;
            }
          }
          return rv;
        }
        /**
         * Sets the selection based on rows and columns within the editor Markdown content.
         * @param {object} focus Object representing the selection, needs to have properties row and col.
         */
        setSelection(focus) {
          let anchor = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : null;
          if (!focus)
            return;
          let range = document.createRange();
          let {
            node: focusNode,
            offset: focusOffset
          } = this.computeNodeAndOffset(focus.row, focus.col, anchor && anchor.row == focus.row && anchor.col > focus.col);
          let anchorNode = null, anchorOffset = null;
          if (anchor && (anchor.row != focus.row || anchor.col != focus.col)) {
            let {
              node,
              offset
            } = this.computeNodeAndOffset(anchor.row, anchor.col, focus.row == anchor.row && focus.col > anchor.col);
            anchorNode = node;
            anchorOffset = offset;
          }
          if (anchorNode)
            range.setStart(anchorNode, anchorOffset);
          else
            range.setStart(focusNode, focusOffset);
          range.setEnd(focusNode, focusOffset);
          let windowSelection = window.getSelection();
          windowSelection.removeAllRanges();
          windowSelection.addRange(range);
        }
        /** 
         * Event handler for input events 
         */
        handleInputEvent(event) {
          let focus = this.getSelection();
          if ((event.inputType == "insertParagraph" || event.inputType == "insertLineBreak") && focus) {
            this.clearDirtyFlag();
            this.processNewParagraph(focus);
          } else {
            if (!this.e.firstChild) {
              this.e.innerHTML = '<div class="TMBlankLine"><br></div>';
            } else {
              for (let childNode = this.e.firstChild; childNode; childNode = childNode.nextSibling) {
                if (childNode.nodeType != 3 || childNode.tagName != "DIV") {
                  let divWrapper = document.createElement("div");
                  this.e.insertBefore(divWrapper, childNode);
                  this.e.removeChild(childNode);
                  divWrapper.appendChild(childNode);
                }
              }
            }
            this.updateLineContentsAndFormatting();
          }
          if (focus)
            this.setSelection(focus);
          this.fireChange();
        }
        /**
         * Event handler for "selectionchange" events.
         */
        handleSelectionChangeEvent() {
          this.fireSelection();
        }
        /**
         * Convenience function to "splice" new lines into the arrays this.lines, this.lineDirty, this.lineTypes, and the DOM elements 
         * underneath the editor element.
         * This method is essentially Array.splice, only that the third parameter takes an un-spread array (and the forth parameter)
         * determines whether the DOM should also be adjusted.
         * 
         * @param {int} startLine Position at which to start changing the array of lines
         * @param {int} linesToDelete Number of lines to delete
         * @param {array} linesToInsert Array of strings representing the lines to be inserted
         * @param {boolean} adjustLineElements If true, then <div> elements are also inserted in the DOM at the respective position
         */
        spliceLines(startLine) {
          let linesToDelete = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : 0;
          let linesToInsert = arguments.length > 2 && arguments[2] !== void 0 ? arguments[2] : [];
          let adjustLineElements = arguments.length > 3 && arguments[3] !== void 0 ? arguments[3] : true;
          if (adjustLineElements) {
            for (let i = 0; i < linesToDelete; i++) {
              this.e.removeChild(this.e.childNodes[startLine]);
            }
          }
          let insertedBlank = [];
          let insertedDirty = [];
          for (let i = 0; i < linesToInsert.length; i++) {
            insertedBlank.push("");
            insertedDirty.push(true);
            if (adjustLineElements) {
              if (this.e.childNodes[startLine])
                this.e.insertBefore(document.createElement("div"), this.e.childNodes[startLine]);
              else
                this.e.appendChild(document.createElement("div"));
            }
          }
          this.lines.splice(startLine, linesToDelete, ...linesToInsert);
          this.lineTypes.splice(startLine, linesToDelete, ...insertedBlank);
          this.lineDirty.splice(startLine, linesToDelete, ...insertedDirty);
        }
        /**
         * Event handler for the "paste" event
         */
        handlePaste(event) {
          event.preventDefault();
          let text = (event.originalEvent || event).clipboardData.getData("text/plain");
          this.paste(text);
        }
        /**
         * Pastes the text at the current selection (or at the end, if no current selection)
         * @param {string} text 
         */
        paste(text) {
          let anchor = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : null;
          let focus = arguments.length > 2 && arguments[2] !== void 0 ? arguments[2] : null;
          if (!anchor)
            anchor = this.getSelection(true);
          if (!focus)
            focus = this.getSelection(false);
          let beginning, end;
          if (!focus) {
            focus = {
              row: this.lines.length - 1,
              col: this.lines[this.lines.length - 1].length
            };
          }
          if (!anchor) {
            anchor = focus;
          }
          if (anchor.row < focus.row || anchor.row == focus.row && anchor.col <= focus.col) {
            beginning = anchor;
            end = focus;
          } else {
            beginning = focus;
            end = anchor;
          }
          let insertedLines = text.split(/(?:\r\n|\r|\n)/);
          let lineBefore = this.lines[beginning.row].substr(0, beginning.col);
          let lineEnd = this.lines[end.row].substr(end.col);
          insertedLines[0] = lineBefore.concat(insertedLines[0]);
          let endColPos = insertedLines[insertedLines.length - 1].length;
          insertedLines[insertedLines.length - 1] = insertedLines[insertedLines.length - 1].concat(lineEnd);
          this.spliceLines(beginning.row, 1 + end.row - beginning.row, insertedLines);
          focus.row = beginning.row + insertedLines.length - 1;
          focus.col = endColPos;
          this.updateFormatting();
          this.setSelection(focus);
          this.fireChange();
        }
        /**
         * Computes the (lowest in the DOM tree) common ancestor of two DOM nodes.
         * @param {Node} node1 the first node
         * @param {Node} node2 the second node
         * @returns {Node} The commen ancestor node, or null if there is no common ancestor
         */
        computeCommonAncestor(node1, node2) {
          if (!node1 || !node2)
            return null;
          if (node1 == node2)
            return node1;
          const ancestry = (node) => {
            let ancestry3 = [];
            while (node) {
              ancestry3.unshift(node);
              node = node.parentNode;
            }
            return ancestry3;
          };
          const ancestry1 = ancestry(node1);
          const ancestry2 = ancestry(node2);
          if (ancestry1[0] != ancestry2[0])
            return null;
          let i;
          for (i = 0; ancestry1[i] == ancestry2[i]; i++)
            ;
          return ancestry1[i - 1];
        }
        /**
         * Finds the (lowest in the DOM tree) enclosing DOM node with a given class.
         * @param {object} focus The focus selection object
         * @param {object} anchor The anchor selection object
         * @param {string} className The class name to find
         * @returns {Node} The enclosing DOM node with the respective class (inside the editor), if there is one; null otherwise.
         */
        computeEnclosingMarkupNode(focus, anchor, className) {
          let node = null;
          if (!focus)
            return null;
          if (!anchor) {
            node = focus.node;
          } else {
            if (focus.row != anchor.row)
              return null;
            node = this.computeCommonAncestor(focus.node, anchor.node);
          }
          if (!node)
            return null;
          while (node != this.e) {
            if (node.className && node.className.includes(className))
              return node;
            node = node.parentNode;
          }
          return null;
        }
        /**
         * Returns the state (true / false) of all commands.
         * @param focus Focus of the selection. If not given, assumes the current focus.
         */
        getCommandState() {
          let focus = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : null;
          let anchor = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : null;
          let commandState = {};
          if (!focus)
            focus = this.getSelection(false);
          if (!anchor)
            anchor = this.getSelection(true);
          if (!focus) {
            for (let cmd in _grammar.commands) {
              commandState[cmd] = null;
            }
            return commandState;
          }
          if (!anchor)
            anchor = focus;
          let start, end;
          if (anchor.row < focus.row || anchor.row == focus.row && anchor.col < focus.col) {
            start = anchor;
            end = focus;
          } else {
            start = focus;
            end = anchor;
          }
          if (end.row > start.row && end.col == 0) {
            end.row--;
            end.col = this.lines[end.row].length;
          }
          for (let cmd in _grammar.commands) {
            if (_grammar.commands[cmd].type == "inline") {
              if (!focus || focus.row != anchor.row || !this.isInlineFormattingAllowed(focus, anchor)) {
                commandState[cmd] = null;
              } else {
                commandState[cmd] = !!this.computeEnclosingMarkupNode(focus, anchor, _grammar.commands[cmd].className) || // ... or if it's an empty string preceded by and followed by formatting markers, e.g. **|** where | is the cursor
                focus.col == anchor.col && !!this.lines[focus.row].substr(0, focus.col).match(_grammar.commands[cmd].unset.prePattern) && !!this.lines[focus.row].substr(focus.col).match(_grammar.commands[cmd].unset.postPattern);
              }
            }
            if (_grammar.commands[cmd].type == "line") {
              if (!focus) {
                commandState[cmd] = null;
              } else {
                let state = this.lineTypes[start.row] == _grammar.commands[cmd].className;
                for (let line = start.row; line <= end.row; line++) {
                  if (this.lineTypes[line] == _grammar.commands[cmd].className != state) {
                    state = null;
                    break;
                  }
                }
                commandState[cmd] = state;
              }
            }
          }
          return commandState;
        }
        /**
         * Sets a command state
         * @param {string} command 
         * @param {boolean} state 
         */
        setCommandState(command, state) {
          if (_grammar.commands[command].type == "inline") {
            let anchor = this.getSelection(true);
            let focus = this.getSelection(false);
            if (!anchor)
              anchor = focus;
            if (!anchor)
              return;
            if (anchor.row != focus.row)
              return;
            if (!this.isInlineFormattingAllowed(focus, anchor))
              return;
            let markupNode = this.computeEnclosingMarkupNode(focus, anchor, _grammar.commands[command].className);
            this.clearDirtyFlag();
            if (markupNode) {
              this.lineDirty[focus.row] = true;
              const startCol = this.computeColumn(markupNode, 0);
              const len = markupNode.textContent.length;
              const left = this.lines[focus.row].substr(0, startCol).replace(_grammar.commands[command].unset.prePattern, "");
              const mid = this.lines[focus.row].substr(startCol, len);
              const right = this.lines[focus.row].substr(startCol + len).replace(_grammar.commands[command].unset.postPattern, "");
              this.lines[focus.row] = left.concat(mid, right);
              anchor.col = left.length;
              focus.col = anchor.col + len;
              this.updateFormatting();
              this.setSelection(focus, anchor);
            } else if (focus.col == anchor.col && !!this.lines[focus.row].substr(0, focus.col).match(_grammar.commands[command].unset.prePattern) && !!this.lines[focus.row].substr(focus.col).match(_grammar.commands[command].unset.postPattern)) {
              this.lineDirty[focus.row] = true;
              const left = this.lines[focus.row].substr(0, focus.col).replace(_grammar.commands[command].unset.prePattern, "");
              const right = this.lines[focus.row].substr(focus.col).replace(_grammar.commands[command].unset.postPattern, "");
              this.lines[focus.row] = left.concat(right);
              focus.col = anchor.col = left.length;
              this.updateFormatting();
              this.setSelection(focus, anchor);
            } else {
              let {
                startCol,
                endCol
              } = focus.col < anchor.col ? {
                startCol: focus.col,
                endCol: anchor.col
              } : {
                startCol: anchor.col,
                endCol: focus.col
              };
              let match = this.lines[focus.row].substr(startCol, endCol - startCol).match(/^(?<leading>\s*).*\S(?<trailing>\s*)$/);
              if (match) {
                startCol += match.groups.leading.length;
                endCol -= match.groups.trailing.length;
              }
              focus.col = startCol;
              anchor.col = endCol;
              this.wrapSelection(_grammar.commands[command].set.pre, _grammar.commands[command].set.post, focus, anchor);
            }
          } else if (_grammar.commands[command].type == "line") {
            let anchor = this.getSelection(true);
            let focus = this.getSelection(false);
            if (!anchor)
              anchor = focus;
            if (!focus)
              return;
            this.clearDirtyFlag();
            let start = anchor.row > focus.row ? focus : anchor;
            let end = anchor.row > focus.row ? anchor : focus;
            if (end.row > start.row && end.col == 0) {
              end.row--;
            }
            for (let line = start.row; line <= end.row; line++) {
              if (state && this.lineTypes[line] != _grammar.commands[command].className) {
                this.lines[line] = this.lines[line].replace(_grammar.commands[command].set.pattern, _grammar.commands[command].set.replacement.replace("$#", line - start.row + 1));
                this.lineDirty[line] = true;
              }
              if (!state && this.lineTypes[line] == _grammar.commands[command].className) {
                this.lines[line] = this.lines[line].replace(_grammar.commands[command].unset.pattern, _grammar.commands[command].unset.replacement);
                this.lineDirty[line] = true;
              }
            }
            this.updateFormatting();
            this.setSelection({
              row: end.row,
              col: this.lines[end.row].length
            }, {
              row: start.row,
              col: 0
            });
          }
        }
        /**
         * Returns whether or not inline formatting is allowed at the current focus 
         * @param {object} focus The current focus
         */
        isInlineFormattingAllowed() {
          const sel = window.getSelection();
          if (!sel)
            return false;
          if (sel.isCollapsed && sel.focusNode.nodeType == 3 && sel.focusOffset == sel.focusNode.nodeValue.length) {
            let node;
            for (node = sel.focusNode; node && node.nextSibling == null; node = node.parentNode)
              ;
            if (node && node.nextSibling.className && node.nextSibling.className.includes("TMInlineFormatted"))
              return true;
          }
          let ancestor = this.computeCommonAncestor(sel.focusNode, sel.anchorNode);
          if (!ancestor)
            return false;
          while (ancestor && ancestor != this.e) {
            if (ancestor.className && (ancestor.className.includes("TMInlineFormatted") || ancestor.className.includes("TMBlankLine")))
              return true;
            ancestor = ancestor.parentNode;
          }
          return false;
        }
        /**
         * Wraps the current selection in the strings pre and post. If the selection is not on one line, returns.
         * @param {string} pre The string to insert before the selection.
         * @param {string} post The string to insert after the selection.
         * @param {object} focus The current selection focus. If null, selection will be computed.
         * @param {object} anchor The current selection focus. If null, selection will be computed.
         */
        wrapSelection(pre, post) {
          let focus = arguments.length > 2 && arguments[2] !== void 0 ? arguments[2] : null;
          let anchor = arguments.length > 3 && arguments[3] !== void 0 ? arguments[3] : null;
          if (!focus)
            focus = this.getSelection(false);
          if (!anchor)
            anchor = this.getSelection(true);
          if (!focus || !anchor || focus.row != anchor.row)
            return;
          this.lineDirty[focus.row] = true;
          const startCol = focus.col < anchor.col ? focus.col : anchor.col;
          const endCol = focus.col < anchor.col ? anchor.col : focus.col;
          const left = this.lines[focus.row].substr(0, startCol).concat(pre);
          const mid = endCol == startCol ? "" : this.lines[focus.row].substr(startCol, endCol - startCol);
          const right = post.concat(this.lines[focus.row].substr(endCol));
          this.lines[focus.row] = left.concat(mid, right);
          anchor.col = left.length;
          focus.col = anchor.col + mid.length;
          this.updateFormatting();
          this.setSelection(focus, anchor);
        }
        /**
         * Toggles the command state for a command (true <-> false)
         * @param {string} command The editor command
         */
        toggleCommandState(command) {
          if (!this.lastCommandState)
            this.lastCommandState = this.getCommandState();
          this.setCommandState(command, !this.lastCommandState[command]);
        }
        /**
         * Fires a change event. Updates the linked textarea and notifies any event listeners.
         */
        fireChange() {
          if (!this.textarea && !this.listeners.change.length)
            return;
          const content = this.getContent();
          if (this.textarea)
            this.textarea.value = content;
          for (let listener of this.listeners.change) {
            listener({
              content,
              linesDirty: this.linesDirty
            });
          }
        }
        /**
         * Fires a "selection changed" event.
         */
        fireSelection() {
          if (this.listeners.selection && this.listeners.selection.length) {
            let focus = this.getSelection(false);
            let anchor = this.getSelection(true);
            let commandState = this.getCommandState(focus, anchor);
            if (this.lastCommandState) {
              Object.assign(this.lastCommandState, commandState);
            } else {
              this.lastCommandState = Object.assign({}, commandState);
            }
            for (let listener of this.listeners.selection) {
              listener({
                focus,
                anchor,
                commandState: this.lastCommandState
              });
            }
          }
        }
        /**
         * Adds an event listener.
         * @param {string} type The type of event to listen to. Can be 'change' or 'selection'
         * @param {*} listener Function of the type (event) => {} to be called when the event occurs.
         */
        addEventListener(type, listener) {
          if (type.match(/^(?:change|input)$/i)) {
            this.listeners.change.push(listener);
          }
          if (type.match(/^(?:selection|selectionchange)$/i)) {
            this.listeners.selection.push(listener);
          }
        }
      };
      var _default = exports.default = Editor;
    }
  });

  // node_modules/tiny-markdown-editor/lib/index.js
  var require_lib = __commonJS({
    "node_modules/tiny-markdown-editor/lib/index.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", {
        value: true
      });
      Object.defineProperty(exports, "CommandBar", {
        enumerable: true,
        get: function() {
          return _TinyMDECommandBar.default;
        }
      });
      Object.defineProperty(exports, "Editor", {
        enumerable: true,
        get: function() {
          return _TinyMDE.default;
        }
      });
      var _TinyMDECommandBar = _interopRequireDefault(require_TinyMDECommandBar());
      var _TinyMDE = _interopRequireDefault(require_TinyMDE());
      function _interopRequireDefault(obj) {
        return obj && obj.__esModule ? obj : { default: obj };
      }
    }
  });

  // node_modules/@icelab/defo/dist/index.bundle.js
  var require_index_bundle = __commonJS({
    "node_modules/@icelab/defo/dist/index.bundle.js"(exports, module) {
      !function(e, t) {
        "object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : (e = e || self).Defo = t();
      }(exports, function() {
        "use strict";
        function e(e2, t2) {
          return function(e3, t3) {
            return Object.keys(e3.dataset).filter((e4) => 0 === e4.indexOf(t3));
          }(e2, t2).length > 0;
        }
        function t(e2) {
          return e2.charAt(0).toUpperCase() + e2.slice(1);
        }
        function r(e2) {
          try {
            return JSON.parse(e2);
          } catch (e3) {
          }
          return e2;
        }
        function o({ prefix: e2, scope: t2, views: r2 }) {
          Object.keys(r2).forEach((o2) => {
            const a2 = `data-${e2}-${s = o2, s.replace(/([a-z0-9])([A-Z])/g, "$1-$2").toLowerCase()}`;
            var s;
            let i = Array.prototype.slice.call(t2.querySelectorAll(`[${a2}]`));
            t2.hasAttribute(a2) && (i = [t2].concat(i)), i.forEach((t3) => {
              n(t3, e2, r2, o2);
            });
          });
        }
        function n(e2, o2, n2, a2) {
          if (e2._defoUpdate && e2._defoUpdate[a2])
            return;
          const s = n2[a2], i = function(e3, r2) {
            return `${o3 = e3, o3.replace(/^[_.\- ]+/, "").toLowerCase().replace(/[_.\- ]+(\w|$)/g, (e4, t2) => t2.toUpperCase()).replace(/\d+(\w|$)/g, (e4) => e4.toUpperCase())}${t(r2)}`;
            var o3;
          }(o2, a2);
          if (!s || !(i in e2.dataset))
            return;
          const c = s(e2, r(e2.dataset[i]));
          e2._defoUpdate = e2._defoUpdate || {}, e2._defoDestroy = e2._defoDestroy || {}, e2._defoUpdate[a2] = function(e3) {
            return function(t2, o3) {
              t2 = t2 ? r(t2) : t2, o3 = o3 ? r(o3) : o3, Promise.resolve(e3).then((e4) => {
                e4.update && e4.update(t2, o3);
              });
            };
          }(c), e2._defoDestroy[a2] = function(e3, t2, r2) {
            return function() {
              Promise.resolve(e3).then((e4) => {
                e4.destroy && (e4.destroy(), delete t2._defoUpdate[r2], delete t2._defoDestroy[r2]);
              });
            };
          }(c, e2, a2);
        }
        function a({ prefix: r2, scope: a2, views: s }) {
          const i = new MutationObserver((a3) => {
            a3.forEach((a4) => {
              const i2 = a4.target;
              if ("attributes" === a4.type && function(e2, t2) {
                return 0 === e2.indexOf(`data-${t2}-`);
              }(a4.attributeName, r2)) {
                const e2 = a4.attributeName.split("-").slice(2).map((e3, r3) => r3 > 0 ? t(e3) : e3).join("");
                i2.hasAttribute(a4.attributeName) ? null !== a4.oldValue ? i2._defoUpdate[e2](i2.getAttribute(a4.attributeName), a4.oldValue) : n(i2, r2, s, e2) : i2._defoDestroy[e2]();
              } else
                "childList" === a4.type && (Array.prototype.slice.call(a4.removedNodes).filter((e2) => e2.nodeType === e2.ELEMENT_NODE).filter((t2) => e(t2, r2)).forEach((e2) => {
                  Object.keys(e2._defoDestroy).forEach((t2) => {
                    e2._defoDestroy[t2]();
                  });
                }), Array.prototype.slice.call(a4.addedNodes).filter((e2) => e2.nodeType === e2.ELEMENT_NODE).forEach((e2) => {
                  Promise.resolve(e2).then((e3) => {
                    o({ prefix: r2, scope: e3, views: s });
                  });
                }));
            });
          });
          return i.observe(a2, { attributes: true, attributeOldValue: true, childList: true, characterData: false, subtree: true }), o({ prefix: r2, scope: a2, views: s }), i;
        }
        return function({ prefix: e2 = "defo", scope: t2 = document.documentElement, views: r2 = {} } = {}) {
          const o2 = a({ prefix: e2, scope: t2, views: r2 });
          return { destroy: () => {
            o2.disconnect();
          } };
        };
      });
    }
  });

  // slices/admin/assets/js/app.js
  var import_tiny_markdown_editor = __toESM(require_lib(), 1);
  var import_defo = __toESM(require_index_bundle(), 1);
  (function() {
    document.addEventListener("alpine:init", () => {
      Alpine.magic("clipboard", () => {
        return (subject) => navigator.clipboard.writeText(subject);
      });
    });
    document.addEventListener("DOMContentLoaded", function() {
      const views = {
        markdown: (el, attrs) => {
          var tinyMDE = new import_tiny_markdown_editor.default.Editor({ textarea: attrs.editorId });
          return {
            update: (newName, oldName) => {
            },
            destroy: () => {
            }
          };
        }
      };
      (0, import_defo.default)({ views });
    });
  })();
})();
