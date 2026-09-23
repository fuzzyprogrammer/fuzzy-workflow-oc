# openpixal Agency Repository Guidelines (fuzzy-workflow-oc)

## Core Technical & Aesthetic Principles
1. **Mobile-First Responsive UX**: Build for 375px viewports first (`emilkowalski/mobile-native` rules). Ensure 44x44px minimum touch targets, resolve 100vh viewport issues, remove touch highlight flashes, and eliminate sticky hover states before scaling to desktop (1440px).
2. **Day & Night Theme Default**: Every tool/site must ship with dark and light mode theme toggling configured out of the box using CSS variables and Tailwind class strategies.
3. **Non-AI Aesthetic Standard**: Use composable `shadcn-ui` primitives and `ui-ux-pro-max` design intelligence. Strictly avoid generic "AI purple/pink gradients", glassmorphism overuses, or robotic template layouts. Design clean, human-centric utility tools.
4. **Localization Architecture**: Zero hardcoded strings. All user-facing UI labels must use dynamic translation keys (`t('key')`) matching JSON files in `src/locales/`.
5. **Quality & Methodology**: Enforce Test-Driven Development (TDD) via `superpowers/test-driven-development`. Run `agent-browser a11y` accessibility audits (`axe-core`) across all regional and global routes prior to deployment.