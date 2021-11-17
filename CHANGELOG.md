# Bagnon_BoE Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

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
