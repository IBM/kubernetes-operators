module.exports = {
  title: 'Kubernetes Operators',
  tagline: 'by IBM Developer - Open Hybrid Build Team',
  url: 'https://remkohdev.github.io',
  baseUrl: '/kubernetes-operators/',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'remkohdev', // Usually your GitHub org/user name.
  projectName: 'kubernetes-operators', // Usually your repo name.
  themeConfig: {
    colorMode: {
      defaultMode: 'dark',
      respectPrefersColorScheme: false,
    },
    navbar: {
      title: '',
      logo: {
        alt: 'IBM',
        src: 'img/logo.svg',
      },
      items: [
        {
            to: 'docs/labs/lab1',
            label: 'Labs',
            position: 'left',
        },
        {
            type: 'docsVersionDropdown',
            position: 'right',
  
            // Add additional dropdown items at the beginning/end of the dropdown.
            dropdownItemsBefore: [],
            dropdownItemsAfter: [],

            // Do not add the link active class when browsing docs.
            dropdownActiveClassDisabled: true,
          },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
            title: 'IBM Developer',
            items: [
              {
                  label: 'Open Source',
                  href: 'https://www.ibm.com/opensource/',
              },
              {
                label: 'Github',
                href: 'https://github.com/IBM',
              },
              {
                  label: 'Youtube',
                  href: 'https://cognitiveclass.ai/',
              },
              {
                  label: 'Conferences',
                  href: 'https://developer.ibm.com/conferences/',
              },
              {
                label: 'Tutorials',
                href: 'https://developer.ibm.com/technologies/containers/patterns/',
              },
              {
                label: 'Courses',
                href: 'https://cognitiveclass.ai/',
              },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} <a href="https://developer.ibm.com" target="_blank">IBM Developer</a>, built with <a href="https://v2.docusaurus.io/" target="_blank">Docusaurus v2</a> and <a href="https://www.carbondesignsystem.com/" target="_blank">Carbon Design System</a>.`,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl:
            'https://github.com/remkohdev/kubernetes-operators/',
        },
        blog: {
          showReadingTime: true,
          // Please change this to your repo.
          editUrl:
            'https://github.com/remkohdev/kubernetes-operators/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
