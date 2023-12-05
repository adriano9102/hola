<template>
  <v-theme-provider :dark="dark">
    <div>
      <base-info-card
        title="MANTENTE EN CONTACTO CON NOSOTROS"
        pace="6"
      >
        Mantente en contacto con nosotros, si deseas información sobre algún
        tema en específico puedes comunicarte al +34 698 56 54 00, +34 657 16 18
        29 o si deseas una cotización puedes enviarnos tu solicitud al correo:
        compliance@divergtech.com. ¡Estamos para servirles!
      </base-info-card>

      <base-business-contact dense />
    </div>
  </v-theme-provider>
</template>

<script>
/* eslint-disable vue/require-default-prop */

export default {
  name: "BaseBusinessInfo",

  props: { dark: Boolean },

  data: () => ({
    business: [
      {
        icon: "mdi-map-marker-outline",
        title: "Address",
        text: "8553 N. Beach St. Ste. 227<br>Fort Worth, Texas 76137"
      },
      {
        icon: "mdi-cellphone",
        title: "Phone",
        text: "01 (800) 433 744<br>01 (800) 433 633"
      },
      {
        icon: "mdi-email",
        title: "Email",
        text: "john@vuetifyjs.com<br>heather@vuetifyjs.com"
      }
    ]
  })
};
</script>
