# Mozilla User Preferences

/* Default Profile Preferences
 * ---------------------------
 * 
 * Main changes:
 *                  + Use RAM for cache (disable disk caching)
 *                  + PDFJS disabled
 *                  + 3rd party cookies blocked
 *                  + disable saving of passwords
 *                  + Disable network prefetching
 *                  + Disable search engine suggestions
 *                  + Disable Geolocation
 *                  + Disable Google Safebrowsing
 *                  + Disable Pocket
 *                  + Enable OMTC to fix tearing
 */

user_pref("browser.cache.disk.capacity", 358400);
user_pref("browser.cache.disk.enable", false);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("pdfjs.disabled", true);
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.max_entry_size", -1);
user_pref("signon.rememberSignons", false); 
user_pref("network.prefetch-next", false);
user_pref("browser.search.suggest.enabled", false);
user_pref("geo.enabled", false);
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.pocket.enabled", false);
user_pref("layers.acceleration.force-enabled", true);