## About The Pull Request

<!-- Describe your pull request. Avoid text walls, use concise bullet points for easier readability. Document every change, or this can delay review and even discourage maintainers from merging your PR. -->

## Developer's checklist
<!--
Hey you, yes you, read this section carefully and check the boxes if they are true, or go back and change things until the checkboxes can be truthfully clicked!
-->
- [ ] I have modularized whatever changes I could. <!--  Do this by putting stuff in the modular caustic folder, and modifying Azure code by calling your code from the places where you could put the code, for an example-->
- [ ] I have marked the start and end of my edits outside the caustic modular folder (if applicable) for changes that I couldn't modularize.
<!--
Do this one like so
Azure
///Caustic edit
Your code
///Caustic edit end
Azure
This makes it easier for maintainers to keep track of what's ours.
-->
- [ ] It compiled locally, and I tested new features, or potential issues with related features, to the best of my abilities.
- [ ] This change applies mainly to our server, and wouldn't be in a better place upstream / cannot wait until the weekly upstream update.

## Testing Evidence

<!-- It's mandatory to test your PR. Provide images, clips or description of how you tested your changes where possible. -->

## Why It's Good For The Game

<!-- Argue for the merits of your changes and how they benefit the game, especially if they are controversial. If you can't, then it probably isn't good for the game in the first place. -->

<!-- By contributing to this codebase, you confirm that any code and sprites you provide are legal to share and will be licensed under the terms specified in README.md — AGPLv3 for code and CC-BY-SA 3.0 for assets, unless otherwise stated. You acknowledge that the project maintainers are under no obligation to remove any materials that do not violate these licenses. -->

## Changelog
<!-- If your PR modifies aspects of the game that can be concretely observed by players or admins you should add a changelog. If your change does NOT meet this description, remove this section. Please note that maintainers freely reserve the right to remove and add tags should they deem it appropriate. You can attempt to finagle the system all you want, but it's best to shoot for clear communication right off the bat. -->

<!-- !! Do not add whitespace in-between the entries, do not change the tags and do not leave the tags without any entries. -->

:cl:
add: Added new mechanics or gameplay changes
add: Added more things
del: Removed old things
qol: made something easier to use
balance: rebalanced something
fix: fixed a few things
sound: added/modified/removed audio or sound effects
image: added/modified/removed some icons or images
map: added/modified/removed map content
spellcheck: fixed a few typos
code: changed some code
refactor: refactored some code
config: changed some config setting
admin: messed with admin stuff
server: something server ops should know
/:cl:

<!-- Both :cl:'s are required for the changelog to work! You can put your name to the right of the first :cl: if you want to overwrite your GitHub username as author ingame. -->
<!-- You can use multiple of the same prefix (they're only used for the icon ingame) and delete the unneeded ones. Despite some of the tags, changelogs should generally represent how a player might be affected by the changes rather than a summary of the PR's contents. -->
