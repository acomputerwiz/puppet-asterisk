# Install an asterisk language pack.
#
# The language packs defined here were taken directly from packages available
# on debian and so this might not work for other distros.
#
define asterisk::cfg::language {
  $allowed_languages = [
    'de',
    'es-co',
    'fr-armelle',
    'fr-proformatique',
    'it-menardi',
    'it-menardi-alaw',
    'it-menardi-gsm',
    'it-menardi-wav',
    'se',
    'es',
  ]
  $allowed_core_languages = [
    'core-sounds-en',
    'core-sounds-en-g722',
    'core-sounds-en-gsm',
    'core-sounds-en-wav',
    'core-sounds-es',
    'core-sounds-es-g722',
    'core-sounds-es-gsm',
    'core-sounds-es-wav',
    'core-sounds-fr',
    'core-sounds-fr-g722',
    'core-sounds-fr-gsm',
    'core-sounds-fr-wav',
    'core-sounds-ru',
    'core-sounds-ru-g722',
    'core-sounds-ru-gsm',
    'core-sounds-ru-wav',
  ]

  if !($name in $allowed_languages) and !($name in $allowed_core_languages) {
    fail("Language '${name}' for Asterisk is unsupported.")
    notify {"Language '${name}' for Asterisk is unsupported.": }
  }

  if ($name in $allowed_core_languages) {
    package { "asterisk-${name}": ensure => installed; }
  }
  else {
    package { "asterisk-prompt-${name}": ensure => installed; }
  }
}
