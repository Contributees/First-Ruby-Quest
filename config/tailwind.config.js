const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
       colors: {
        purple: '#6750A4',
        amethyst: '#958DA5',
        pink: '#B58392',
        darkpink: '#633B48',
        neutral: '#939094',
        error: '#B3261E',
        snow: '#FFFBFE',
        silver: '#79747E',
        dark: '#1C1B1F',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
