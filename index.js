var os = require('os')
var path = require('path')

var platform = os.platform()
if (platform !== 'linux' && platform !== 'darwin' && platform !== 'win32') {
  console.error('Unsupported platform.')
  process.exit(1)
}

var arch = os.arch()
if (platform === 'darwin' && arch !== 'x64') {
  console.error('Unsupported architecture.')
  process.exit(1)
}

var mp4boxPath = path.join(
  __dirname.match(/[\/\]app.asar[\//]/) ? __dirname.replace('app.asar', 'app.asar.unpacked') : __dirname,
  'bin',
  platform,
  arch,
  platform === 'win32' ? 'MP4Box.exe' : 'MP4Box'
)

exports.path = mp4boxPath;
