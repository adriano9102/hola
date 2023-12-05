<template>
  <div>
    <base-info-card
      :title="title"
      :subtitle="subtitle"
      space="4"
      color="primary"
    />

    <base-text-field label="Nombre" />

    <base-text-field label="Correo" />

    <base-text-field label="Asunto" />

    <base-textarea
      class="mb-6"
      label="Su necesidad y descripción"
    />

    <base-btn
      :color="!theme.isDark ? 'accent' : 'white'"
      href="mailto:shop@vuetifyjs.com?subject=Zero%20Theme%20Question"
      outlined
      target="_blank"
    >
      Enviar Mensaje
    </base-btn>
  </div>
</template>

<script>
/* eslint-disable vue/require-default-prop */

export default {
  name: "BaseContactForm",

  // Injected from the Vuetify Themeable mixin
  inject: ["theme"],

  props: {
    subtitle: String,
    title: {
      type: String,
      default: "MAIL US YOUR MESSAGE"
    }
  }
};
</script>
