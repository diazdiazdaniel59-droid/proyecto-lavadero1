const fs = require('fs');
const path = require('path');

const root = path.join(__dirname, '..');
const src = path.join(root, 'public', 'index.html');
const distDir = path.join(root, 'dist');
const dest = path.join(distDir, 'index.html');

if (!fs.existsSync(src)) {
  console.error('ERROR: No existe public/index.html');
  process.exit(1);
}

fs.mkdirSync(distDir, { recursive: true });
fs.copyFileSync(src, dest);
console.log('Build listo: dist/index.html (' + fs.statSync(dest).size + ' bytes)');
