<template>
  <base-section id="theme-features">
    <base-section-heading :title="$t('qs')">
      {{ $t('et') }}
    </base-section-heading>

    <v-container>
      <v-row>
        <v-col
          v-for="(feature, i) in features"
          :key="i"
          cols="12"
          md="6"
        >
          <base-avatar-card
            v-bind="feature"
            align="justify"
            horizontal
          >
            {{ $t(feature.description) }}
          </base-avatar-card>
        </v-col>
      </v-row>
    </v-container>
  </base-section>
</template>

<script>
export default {
  name: "SectionThemeFeatures",

  data: () => ({
    features: [
      {
        color: "primary",
        //dark: true,
        title: "cf",
        icon: "mdi-help-circle-outline",
        description: "na"
      },
      {
        title: "m",
        //color: "primary",
        icon: "mdi-fountain-pen-tip",
        description: "ca"
      },
      {
        title: "qh",
        icon: "mdi-help-circle-outline",
        //color: "primary",
        description: "ap"
      },
      {
        title: "s2",
        icon: "mdi-ice-pop",
        //color: "primary",
        description: "t2"
      }
    ]
  })
};
</script>
