<template>
  <base-section id="about-our-product">
    <base-section-heading
      color="grey lighten-2"
      icon="mdi-vuetify"
      :title="$t('about')"
    />
    <v-container>
      <v-row>
        <v-col
          v-for="card in cards"
          :key="card.title"
          cols="12"
          md="4"
        >
          <base-info-card v-bind="card"/>
        </v-col>
      </v-row>
    </v-container>
  </base-section>
</template>

<script>
export default {
  name: "SectionAboutOurProduct",

  data: () => ({
    cards: [
      {
        title: "hcsi",
        subtitle: "mp",
        text: "ta",
        callout: "01"
      },
      {
        title: "pa",
        subtitle: "oe",
        text: "ct",
        callout: "02"
      },
      {
        title: "fp",
        subtitle: "fi",
        text: "dq",
        callout: "03"
      }
    ]
  })
};
</script>
