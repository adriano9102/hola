
<script>
  // Extensions
  import View from '@/views/View'

  // Mixins
  import LoadSections from '@/mixins/load-sections'

  export default {
    name: 'Inicio',
    metaInfo: { title: 'Inicio' },
    extends: View,
    mixins: [
      LoadSections([
        'hero',
        'about-our-product',
        'theme-features',
        //'features',
        'contact-us',
        //'affiliates',
        //'social-media',
        //'keep-in-touch',
        //'newsletter',
        //'pro-features',
        'info',
      ]),
    ],

    props: {
      id: {
        type: String,
        default: 'Inicio',
      },
    },
  }
</script>
