<template>
  <div>
    <NavbarMenu/>
    <router-view :key="$route.path"/>
  </div>
</template>

<script>

import NavbarMenu from './components/NavbarMenu.vue'

export default {
  name: 'App',
  components: {
    NavbarMenu
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
