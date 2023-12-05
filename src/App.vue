<template>
  <v-fade-transition mode="out-in">
    <router-view/>
  </v-fade-transition>
</template>

<script>
export default {
  name: 'App',
  metaInfo: {
    title: 'App',
    titleTemplate: '%s | Divergtech LLC',
    htmlAttrs: {lang: 'en'},
    meta: [
      {charset: 'utf-8'},
      {name: 'viewport', content: 'width=device-width, initial-scale=1'},
    ],
  },
}
</script>

<style lang="sass">
.extra-padding
  padding-bottom: 66px !important
  padding-top: 66px !important

  @media screen and (max-width: 959px)
    padding-top: 48px !important
    padding-bottom: 48px !important
</style>
