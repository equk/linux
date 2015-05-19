# Mozilla User Preferences

/* Default Profile Preferences
 * ---------------------------
 * 
 * Main changes:
 *                  + Use RAM for cache (disable disk caching)
 *                  + PDFJS disabled
 *                  + 3rd party cookies blocked
 *                  + disable saving of passwords
 */

user_pref("browser.cache.disk.capacity", 358400);
user_pref("browser.cache.disk.enable", false);
user_pref("network.cookie.cookieBehavior", 2);
user_pref("pdfjs.disabled", true);
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.max_entry_size", -1);
user_pref("signon.rememberSignons", false); 
