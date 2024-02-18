echo 'Build Android'
fvm flutter build apk --release

echo 'Build Android App Bundle'
fvm flutter build appbundle --release