<template>
  <v-app>
    <v-app-bar
      app
    >
      <v-toolbar-title v-text="title"/>
      <v-spacer/>
    </v-app-bar>
    <v-content>
      <nuxt/>
    </v-content>
    <v-footer
      app
    >
      <span>&copy; {{ new Date().getFullYear() }} abekoh</span>
    </v-footer>
  </v-app>
</template>

<script>
  export default {
    data() {
      return {
        title: '昼飯Gatcha',
      }
    }
  }
</script>
