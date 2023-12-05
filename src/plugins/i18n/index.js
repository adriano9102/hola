import Vue from 'vue'
import VueI18n from 'vue-i18n'

Vue.use(VueI18n)

function loadLocaleMessages() {
  const locales = require.context('@/plugins/i18n/locales', true, /[A-Za-z0-9-_,\s]+\.json$/i)
  const messages = {}
  locales.keys()
    .forEach(key => {
      const matched = key.match(/([A-Za-z0-9-_]+)\./i)
      if (matched && matched.length > 1) {
        const locale = matched[1]
        messages[locale] = locales(key)
      }
    })

  return messages
}

export const i18n = new VueI18n({
  locale: localStorage.getItem('locale') || process.env.VUE_APP_I18N_LOCALE || 'en', // set locale
  fallbackLocale: localStorage.getItem('fallback_locale') || process.env.VUE_APP_I18N_LOCALE || 'en',
  messages: loadLocaleMessages(),// set locale messages
})

const loadedLanguages = ['en'] // our default language that is preloaded

function setI18nLanguage(lang) {

  i18n.locale = lang

  return lang
}

export function loadLanguageAsync(lang) {

  // If the same language
  if (i18n.locale === lang) {
    return Promise.resolve(setI18nLanguage(lang))
  }

  // If the language was already loaded
  if (loadedLanguages.includes(lang)) {
    return Promise.resolve(setI18nLanguage(lang))
  }

  // If the language hasn't been loaded yet
  return import(/* webpackChunkName: "lang-[request]" */ `@/plugins/i18n/locales/${lang}.json`).then(msgs => {
    i18n.setLocaleMessage(lang, msgs.default)
    localStorage.setItem('locale', process.env.VUE_APP_I18N_LOCALE || 'en')
    localStorage.setItem('fallback_locale', process.env.VUE_APP_I18N_FALLBACK_LOCALE || 'en')
    loadedLanguages.push(lang)

    return setI18nLanguage(lang)
  })
  /* eslint-enable */
}

