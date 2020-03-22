<template>
  <div>
    <v-row align="start" justify="center" class="mt-500px">
      <v-col cols="12">
        <p class="display-2 text-center">豚野郎</p>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12" align="center">
        <v-rating half-increments v-model="rating"/>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12">
        <GmapMap
          :center="resultLocation"
          :zoom="16"
          map-type-id="roadmap"
          style="height: 500px"
        />
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="4">
        <v-btn x-large color="primary">Google Mapで開く</v-btn>
      </v-col>
      <v-col cols="4">
        <v-btn x-large color="primary">もう一度引く</v-btn>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  export default {
    name: "Result",
    props: ["resultLocation"],
    data() {
      return {
        rating: 2.5
      }
    }
  }
</script>

<style scoped>

</style>
