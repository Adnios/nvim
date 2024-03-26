const status_host = document.querySelector(
  ".monaco-workbench .part.statusbar>.items-container>.statusbar-item.remote-kind"
);

const map = [
  {
    selector: '[aria-label^="-- INSERT --"]',
    property: "--asvetliakov-insert",
  },
  {
    selector: '[aria-label^="-- VISUAL --"]',
    property: "--asvetliakov-visual",
  },
  {
    selector: '[aria-label^="-- VISUAL BLOCK --"]',
    property: "--asvetliakov-visual-block",
  },
  {
    selector: '[aria-label^="-- VISUAL LINE --"]',
    property: "--asvetliakov-visual-line",
  },
  {
    selector: '[aria-label^="-- REPLACE --"]',
    property: "--asvetliakov-replace",
  },
];

function domMutations(mutations) {
  mutations.forEach((mutation) => {
    if (mutation.type == "childList" && mutation.addedNodes.length > 0) {
      let changed = false;
      map.forEach(({ selector, property }) => {
        const element = document.querySelector(selector);
        if (element) {
          const color = getComputedStyle(document.documentElement).getPropertyValue(property);
          status_host.style.backgroundColor = color;
          changed = true;
        }
      });
      if (!changed) {
        status_host.style.backgroundColor = "var(--vscode-statusBarItem-remoteBackground)";
      }
    }
  });
}

const observer = new MutationObserver(domMutations);
const targetNode = document.body;
const config = { childList: true, subtree: true };
observer.observe(targetNode, config);