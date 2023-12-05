<template>
  <div>

    <v-app-bar
      id="home-app-bar"
      app
      color="white"
      elevation="1"
      height="80"
    >
      <base-img
        :src="require('@/assets/logo.svg')"
        class="mr-3 hidden-xs-only"
        contain
        max-width="252"
        width="100%"
      />

      <!--
            <base-img
              :src="require('@/assets/logo-text.png')"
              contain
              max-width="128"
              width="100%"
            />
      -->

      <v-spacer/>

      <div>

        <v-tabs
          class="hidden-sm-and-down"
          optional
        >
          <v-tab>
            <v-menu
              offset-y
              nudge-bottom="22"
              min-width="175"
              left
              :elevation="$vuetify.theme.dark ? 9 : 8"
            >
              <!-- Activator -->
              <template v-slot:activator="{ on, attrs }">
                <div
                  v-bind="attrs"
                  class="d-flex align-center"
                  v-on="on"
                >
                  <v-img
                    :src="require(`@/assets/${$i18n.locale}.png`)"
                    :alt="$i18n.locale"
                    height="14px"
                    width="22px"
                    class="me-2"
                  ></v-img>
                  <span v-if="$vuetify.breakpoint.smAndUp"></span>
                </div>
              </template>

              <!-- Options List -->
              <v-list>
                <v-list-item-group
                  :value="$i18n.locale"
                  @change="updateActiveLocale"
                >
                  <v-list-item
                    v-for="locale in locales"
                    :key="locale.locale"
                    :value="locale.locale"
                  >
                    <v-img
                      :src="locale.img"
                      height="14px"
                      width="22px"
                      class="me-2"
                    ></v-img>
                    <v-list-item-title>{{ locale.title }}</v-list-item-title>
                  </v-list-item>
                </v-list-item-group>
              </v-list>
            </v-menu>


          </v-tab>
          <v-tab
            v-for="(name, i) in items"
            :key="i"
            @click="handleTabClick(name)"
            :exact="name === 'Inicio'"
            :ripple="false"
            active-class="text--primary"
            class="font-weight-bold"
            min-width="96"
            text
          >
            {{ $t(name) }}
          </v-tab>

        </v-tabs>
      </div>

      <v-app-bar-nav-icon
        class="hidden-md-and-up"
        @click="drawer = !drawer"
      />

    </v-app-bar>

    <home-drawer
      v-model="drawer"
      :items="items"
    />
  </div>
</template>

<script>

export default {
  name: "HomeAppBar",

  components: {
    HomeDrawer: () => import("./Drawer")
  },

  data: () => ({
    drawer: null,
    items: [
      "i",
      //'About',
      //'Contacto',
      "l"
    ],
    locales: [
      {
        title: 'Spanish',
        img: require('@/assets/es.png'),
        locale: 'es',
      },
      {
        title: 'English',
        img: require('@/assets/en.png'),
        locale: 'en',
      },
    ]
  }),
  methods: {
    updateActiveLocale(locale) {
      localStorage.setItem('locale', locale ?? 'es')
      localStorage.setItem('fallback_locale', locale ?? 'es')
      this.$i18n.locale = locale
    },
    handleTabClick(name) {
      if (name === 'Acceder') {
        window.open('https://admin.divergtech.com', '_blank'); // Abre la URL en una nueva pestaña
      } else {
        // Manejar otros tabs aquí, si es necesario
        // Por ejemplo, si estás usando Vue Router, podrías hacer algo como esto:
        // this.$router.push({ name });
      }
    }
  }
};
</script>

<style lang="sass">
#home-app-bar
  .v-tabs-slider
    max-width: 24px
    margin: 0 auto

  .v-tab
    &::before
      display: none
</style>
