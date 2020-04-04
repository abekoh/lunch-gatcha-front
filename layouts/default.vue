<template>
  <v-app>
    <v-app-bar
      absolute
      app
    >
      <v-toolbar-title v-text="title"/>
      <v-spacer/>
    </v-app-bar>
    <v-content>
      <nuxt/>
    </v-content>
    <v-footer
      absolute
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
        title: '昼飯ガチャ',
      }
    }
  }
</script>
