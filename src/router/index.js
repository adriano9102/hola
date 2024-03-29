// Imports
import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  scrollBehavior: (to, from, savedPosition) => {
    if (to.hash) return { selector: to.hash }
    if (savedPosition) return savedPosition

    return {
      x: 0,
      y: 0,
    }
  },
  routes: [
    {
      path: '/',
      component: () => import('@/layouts/home/Index.vue'),
      children: [
        {
          path: '',
          name: 'Inicio',
          component: () => import('@/views/home/Index.vue'),
        },
        /*{
          path: 'about',
          name: 'About',
          component: () => import('@/views/about/Index.vue'),
          meta: { src: require('@/assets/about.jpg') },
        },*/
        {
          path: 'contact-us',
          name: 'Contacto',
          component: () => import('@/views/contact-us/Index.vue'),
          meta: { src: require('@/assets/contact.jpg') },
        },
        {
          path: 'login',
          name: 'Acceder',
          component: () => import('@/views/pro/Index.vue'),
          meta: { src: require('@/assets/pro.jpg') },
          beforeEnter () {
            window.open('http://localhost/login',
              '_blank')
          },
        },
        {
          path: '*',
          name: 'FourOhFour',
          component: () => import('@/views/404/Index.vue'),
        },
      ],
    },

  ],
})

export default router
