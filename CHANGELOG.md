# Bagnon_BoE Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [2.0.66-Release] 2023-08-24
- Updated for Classic client patch 1.14.4.

## [2.0.65-Release] 2023-07-25
### Fixed
- Fixed an issue where the plugin would sometime bug out when tooltipdata for an item was missing during the early item caching on logons, relogs and reloads.

## [2.0.64-Release] 2023-07-22
### Changed
- Updated addon listing icon and text format.

## [2.0.63-Release] 2023-07-12
- Bumped to Retail Client Patch 10.1.5.

## [2.0.62-Release] 2023-06-21
- Bumped to Wrath Classic Client Patch 3.4.2.

## [2.0.61-Release] 2023-06-07
### Removed
- Removed the annoying startup message when loaded alongside Bagnon ItemInfo.

## [2.0.60-Release] 2023-05-21
- Cosmetic stuff. Piggybacking.

## [2.0.59-Release] 2023-05-10
- Updated for Bagnon's API for WoW 10.1.0.

## [2.0.58-Release] 2023-05-03
- Updated for WoW 10.1.0.

## [2.0.57-Release] 2023-03-25
- Updated for WoW 10.0.7.

## [2.0.56-Release] 2023-02-28
### Changed
- The Wrath version should take better advantage of blizzard's 10.0.2 bag API which was ported to Wrath in 3.4.1 now.

## [2.0.55-Release] 2023-01-26
- Updated for WoW 10.0.5.

## [2.0.54-Release] 2023-01-18
- Updated for WoW 3.4.1.

## [2.0.53-Release] 2022-12-11
### Fixed
- Changed how bagID is queried to be more consistent across Bagnon updates and versions. A lot of C_Tooltip API errors and general Bagnon lag should be fixed by this.

## [2.0.52-Release] 2022-12-08
### Fixed
- Fixed an issue in retail with items that had less tooltipData than expected.

## [2.0.51-Release] 2022-11-25
### Changed
- Now only uses the old tooltip scanning in the classic versions of WoW.
- Now utilizes the C_TooltipInfo and TooltipUtil APIs in retail. Which will rock when Bagnon is updated for 10.0.2!

## [2.0.50-Release] 2022-11-16
- Bump to retail client patch 10.0.2.

## [2.0.49-Release] 2022-11-02
- Add support for retail 10.0.2 C_Container API.

## [2.0.48-Release] 2022-10-25
- Bumped retail version to the 10.0.0 patch.

## [2.0.47-RC] 2022-10-13
### Fixed
- Fixed an issue where the wrong bag slot would be queried, resulting in wrong information on the items.

## [2.0.46-RC] 2022-10-12
- Full performance rewrite to take much better advantage of Bagnon and Wildpant's APIs.

## [1.0.45-Release] 2022-08-17
- Bump to client patch 9.2.7.

## [1.0.44-Release] 2022-07-29
### Fixed
- Improved the client detection code.

## [1.0.43-Release] 2022-07-28
### Fixed
- Fixed an issue in WotLK Classic that sometimes could cause already bound items to still show the bind status.

## [1.0.42-Release] 2022-07-21
- Add support for WotLK Classic beta.

## [1.0.41-Release] 2022-07-09
- Bump for Classic Era client patch 1.14.3.

## [1.0.40-Release] 2022-05-31
- Bump toc to WoW client patch 9.2.5.

## [1.0.39-Release] 2022-04-07
- Bump for BCC client patch 2.5.4.

## [1.0.38-Release] 2022-02-26
### Fixed
- Reintroduce tooltip scanning for soulbound status to fix problems in the classics. [#6](https://github.com/GoldpawsStuff/Bagnon_BoE/issues/6)

## [1.0.37-Release] 2022-02-23
- ToC bump.

## [1.0.36-Release] 2022-02-16
- ToC bumps and license update.

## [1.0.35-Release] 2022-02-07
### Fixed
- Bind status shows as intended now.

## [1.0.34-Release] 2022-02-06
### Fixed
- Removed the debug output from the previous update that in no way was supposed to be a part of that update!

## [1.0.33-Release] 2022-02-06
### Fixed
- Fixed an issue where bind status would not be properly updated when equipping items.

## [1.0.32-Release] 2021-12-12
### Added
- Added commands to toggle between rarity colored text, and a much clearer white.

### Changed
- Added a message when the presence of the addon Bagnon ItemInfo causes this one to be auto-disabled.

## [1.0.31-Release] 2021-11-17
- Bump Classic Era toc to client patch 1.14.1.

## [1.0.30-Release] 2021-11-03
- Bump Retail toc to client patch 9.1.5.

## [1.0.29-Release] 2021-10-18
- Bump Classic Era toc to client patch 1.14.

## [1.0.28-Release] 2021-09-28
### Changed
- Update auto-disable logic.

## [1.0.27-Release] 2021-09-01
- Bump TOC for BCC 2.5.2.

## [1.0.26-Release] 2021-06-29
- Bump toc for 9.1.0.

## [1.0.25-Release] 2021-06-10
### Changed
- Updated to have BC and Classic versions.

## [1.0.24-Release] 2021-05-04
### Fixed
- Soulbound items should no longer be displayed as still BoE.

## [1.0.23-Release] 2021-04-30
### Changed
- Optimized code and efficiency.
- Removed some unused function calls.

## [1.0.22-Release] 2021-04-05
- Spring cleaning.

## [1.0.21-Release] 2021-03-10
- Bump to WoW client patch 9.0.5.

## [1.0.20-Release] 2020-11-18
- Bump to WoW Client patch 9.0.2.

## [1.0.19-Release] 2020-10-16
- Bump to WoW Client patch 9.0.1.

## [1.0.18-Release] 2020-09-25
- Cache fixes and Bagnon 9.x compatibility.

## [1.0.17-Release] 2020-08-07
### Changed
- ToC updates.

### Fixed
- Properly disable when Bagnon_ItemInfo is loaded.

## [1.0.16-Release] 2020-01-09
### Fixed
- Fixed for Bagnon 8.2.27, December 26th 2019.

## [1.0.15-Release] 2019-10-08
- ToC updates.

## [1.0.14-Release] 2019-10-08
- Bump to WoW Client patch 8.2.5.
- Fix toc links.

## [1.0.13-Release] 2019-07-02
### Changed
- Updated for 8.2.0.

## [1.0.12-Release] 2019-03-29
### Changed
- Updated addon detection to avoid messing with the addon loading order.
- Updated toc display name to be in line with the main bagnon addon.
- Updated description links and team name.

## [1.0.11-Release] 2019-02-27
### Fixed
- Item background scanning should once more update properly when you swap items in a bag slot, and not show the bind status of the item that was previously there.

## [1.0.10-Release] 2019-02-27
### Fixed
- Fixed bug when showing BoE/BoU items.

## [1.0.9-Release] 2019-02-27
### Changed
- Update TOC metadata.
- Update README description and links.
- Major code overhaul and optimization.
- Added auto-disable if Bagnon ItemInfo is loaded.

## [1.0.8-Release] 2019-01-15
### Changed
- Updated TOC & links.

## [1.0.7] 2018-12-15
### Changed
- Updated TOC version to patch 8.1.0.

## [1.0.6] 2018-08-06
### Changed
- Updated TOC version to 8.0.1.

## [1.0.5] 2018-06-05
### Changed
- Updated readme with new BitBucket links. We're leaving GitHub.

## [1.0.4] 2018-01-04
### Fixed
- Fixed an issue where even soulbound items would be displayed as BoE, even when you had bound them to you.

## [1.0.3] 2017-09-07
### Fixed
- Fixed a bug where the "BoE" text would remain visible for empty slots after an item was moved.

## [1.0.2] 2017-09-07
### Fixed
- Fixed a bug where the itemLink would be overwritten and cause a nil bug in string.match later on.

## [1.0.1] 2017-09-04
- Initial commit.
