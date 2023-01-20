symlinkFiles() {
  declare SYMLINK_FILES=$(find symlinks -type f)
  for i in $SYMLINK_FILES; do
    sourceFile="$(pwd)/$i"
    targetFile="$HOME/$(basename $i)"
    echo "$targetFile → $sourceFile"
    ln -fs $sourceFile $targetFile
  done
}

main() {
  symlinkFiles
}

main