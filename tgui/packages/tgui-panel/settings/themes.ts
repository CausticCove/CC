/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

const DARK = {
    BG_BASE: '#000000',
    BG_SECOND: '#000000',
    BUTTON: '#404040',
    TEXT: '#A6A6A6',
  }

let setClientThemeTimer: NodeJS.Timeout;

/**
 * Darkmode preference, originally by Kmc2000.
 *
 * This lets you switch client themes by using winset.
 *
 * If you change ANYTHING in interface/skin.dmf you need to change it here.
 *
 * There's no way round it. We're essentially changing the skin by hand.
 * It's painful but it works, and is the way Lummox suggested.
 */
export function setClientTheme(name) {
  // Transmit once for fast updates and again in a little while in case we won
  // the race against statbrowser init.
  clearInterval(setClientThemeTimer);
  Byond.command(`.output statbrowser:set_theme ${name}`);
  setClientThemeTimer = setTimeout(() => {
    Byond.command(`.output statbrowser:set_theme ${name}`);
  }, 1500);

  Byond.winset({
    // Main windows
    'infobuttons.background-color': DARK.BG_BASE,
    'infobuttons.text-color': DARK.TEXT,
    'infowindow.background-color': DARK.BG_BASE,
    'infowindow.text-color': DARK.TEXT,
    'info_and_buttons.background-color': DARK.BG_BASE,
    'info.background-color': DARK.BG_BASE,
    'info.text-color': DARK.TEXT,
    //'info.tab-background-color': DARK.BG_BASE,
    //'info.tab-text-color': DARK.TEXT,
    'browseroutput.background-color': DARK.BG_BASE,
    'browseroutput.text-color': DARK.TEXT,
    'outputwindow.background-color': DARK.BG_BASE,
    'outputwindow.text-color': DARK.TEXT,
    'mainwindow.background-color': DARK.BG_BASE,
    'split.background-color': DARK.BG_BASE,
    //'grid.line-color': DARK.BG_BASE,
    //'rpane.background-color': DARK.BG_BASE,
    //'rpane.text-color': DARK.TEXT,
    //'rpanewindow.background-color': DARK.BG_BASE,
    //'rpanewindow.text-color': DARK.TEXT,
    // Buttons
    'changelog.background-color': DARK.BUTTON,
    'changelog.text-color': DARK.TEXT,
    'rules.background-color': DARK.BUTTON,
    'rules.text-color': DARK.TEXT,
    'wiki.background-color': DARK.BUTTON,
    'wiki.text-color': DARK.TEXT,
    'forum.background-color': DARK.BUTTON,
    'forum.text-color': DARK.TEXT,
    'github.background-color': DARK.BUTTON,
    'github.text-color': DARK.TEXT,
    'report-issue.background-color': DARK.BUTTON,
    'report-issue.text-color': DARK.TEXT,
    'fullscreen-toggle.background-color': DARK.BUTTON,
    'fullscreen-toggle.text-color': DARK.TEXT,
    // Status and verb tabs
    'output.background-color': DARK.BG_BASE,
    'output.text-color': DARK.TEXT,
    //'statwindow.background-color': DARK.BG_BASE,
    //'statwindow.text-color': DARK.TEXT,
    //'stat.background-color': DARK.BG_BASE,
    //'stat.tab-background-color': DARK.BG_BASE,
    //'stat.text-color': DARK.TEXT,
    //'stat.tab-text-color': DARK.TEXT,
    //'stat.prefix-color': DARK.TEXT,
    //'stat.suffix-color': DARK.TEXT,
    // Say, OOC, me Buttons etc.
    'saybutton.background-color': DARK.BG_BASE,
    'saybutton.text-color': DARK.TEXT,
    'oocbutton.background-color': DARK.BG_BASE,
    'oocbutton.text-color': DARK.TEXT,
    'mebutton.background-color': DARK.BG_BASE,
    'mebutton.text-color': DARK.TEXT,
    'asset_cache_browser.background-color': DARK.BG_BASE,
    'asset_cache_browser.text-color': DARK.TEXT,
    'tooltip.background-color': DARK.BG_BASE,
    'tooltip.text-color': DARK.TEXT,
    'input.background-color': DARK.BG_SECOND,
    'input.text-color': DARK.TEXT,
  });
}
