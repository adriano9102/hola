<template>
  <base-section
    id="info-alt"
    space="56"
  >
    <v-container>
      <v-row justify="space-between">
        <v-col
          cols="12"
          md="5"
        >
          <base-business-info title="MANTENTE EN CONTACTO CON NOSOTROS">
            Mantente en contacto con nosotros, si deseas información sobre algún
            tema en específico puedes comunicarte al +34 698 56 54 00, +34 657
            16 18 29 o si deseas una cotización puedes enviarnos tu solicitud al
            correo: compliance@divergtech.com. ¡Estamos para servirles!
          </base-business-info>
        </v-col>

        <v-col
          cols="12"
          md="6"
        >
          <base-contact-form title="ENVÍENOS SU MENSAJE" />
        </v-col>
      </v-row>
    </v-container>
  </base-section>
</template>

<script>
export default {
  name: "SectionKeepInTouch"
};
</script>
