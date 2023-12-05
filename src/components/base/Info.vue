<template>
  <v-theme-provider :dark="dark">
    <div>
      <!--<base-img
        :src="require('@/assets/zero-logo-dark.svg')"
        contain
        max-width="128"
        min-height="78"
        width="100%"
      />
      <base-title
        size="body-1"
        space="4"
        title="MAPA DE LA WEB"
        weight="regular"
      />-->
      <base-img
        :src="require('@/assets/logo.svg')"
        class="mr-1 hidden-xs-only"
        contain
        max-width="252"
      />
      <!--      <br>
            <base-img
              :src="require('@/assets/logo-text.png')"
              contain
              max-width="128"
              width="100%"
            />-->

      <base-body>
       {{ $t('rp')}}
      </base-body>
      <!--
      <base-btn
        class="mb-12"
        color="white"
        outlined
      >
        More Info
      </base-btn>
      -->
    </div>
  </v-theme-provider>
</template>

<script>
/* eslint-disable vue/require-default-prop */
export default {
  name: "BaseInfo",

  props: {
    title: String,
    dark: Boolean
  },

  data: () => ({
    business: [
      {
        icon: "mdi-map-marker-outline",
        title: "Address",
        text: "2201 MENAUL BLVD NE STE A Albuquerque NM 87107 USA"
      },
      {
        icon: "mdi-cellphone",
        title: "Phone",
        text: "+1 000 000 0000"
      },
      {
        icon: "mdi-email",
        title: "Email",
        text: "compliance@divergtech.com"
      }
    ]
  })
};
</script>
