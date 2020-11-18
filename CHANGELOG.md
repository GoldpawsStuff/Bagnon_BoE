# Bagnon_BoE Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

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
