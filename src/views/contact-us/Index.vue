<script>
  // Extensions
  import View from '@/views/View'

  // Mixins
  import LoadSections from '@/mixins/load-sections'

  export default {
    name: 'ContactUs',

    metaInfo: { title: 'Contacta con Nosotros' },

    extends: View,

    mixins: [
      LoadSections([
        'hero-alt',
        'keep-in-touch',
        //'map',
        'newsletter',
        //'pro-features',
      ]),
    ],

    props: {
      id: {
        type: String,
        default: 'about',
      },
    },
  }
</script>
