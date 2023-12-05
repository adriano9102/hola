<template>
  <base-info-card title="CARACTERISTICAS">
    <a
      v-for="feature in features"
      :key="feature"
      :text="feature"
      class="mb-8 grey--text body-1 d-block text-none"
      href="#"
      v-html="`&rsaquo; ${$t(feature)}`"
    />
  </base-info-card>
</template>

<script>
export default {
  name: 'SectionFeaturesAlt',

  data: () => ({
    features: [
      'cd',
      'fpc',
      'df',
      's2',
    ],
  }),
}
</script>
