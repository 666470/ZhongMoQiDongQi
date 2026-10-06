<template>
	<img class="about-scene-canvas size-full" :src="sceneImage" alt="" />
</template>

<script setup lang="ts">
// The About page used to run a three.js axolotl model in this slot. It is a
// single artwork now -- lighter to load, and the GLTF/three.js loading path is
// gone with it.
import sceneImage from '@/assets/about/terminus-about.jpg'
</script>

<style>
.about-scene-canvas {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
