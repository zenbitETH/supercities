/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
				nab: ['Nabla'],
        nova: ['Nova Square'],
        ice: ['Iceland'],
			},
      colors: {
        bgd: "#101427",
        light: "#F8C355",
        zen: "#F3A754",
        bit: "#008A8A",
        alert: "#DC1B81",
        death: "#682371"
      },
      backgroundImage: theme => ({
        'citycover': "url('https://queretaro.travel/wp-content/uploads/2022/01/Queretaro-Metropolitano-Arcos.jpg')",
      })
    },
  },
  plugins: [],
}
