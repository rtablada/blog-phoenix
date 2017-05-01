// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import 'phoenix_html'
import hljs from 'highlight.js'

const blocks = document.querySelectorAll('pre code');

if (blocks.length) {
  hljs.configure({
    tabReplace: '  ', // 4 spaces
  })

  Array.from(blocks, (block) => {
    hljs.highlightBlock(block);
  });
}
