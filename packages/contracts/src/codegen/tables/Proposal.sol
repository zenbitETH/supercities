// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Proposal")));
bytes32 constant ProposalTableId = _tableId;

struct ProposalData {
  address citizen;
  uint256 proposalTime;
  uint256 upvotes;
  uint256 downvotes;
  string city;
  string country;
}

library Proposal {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](6);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.UINT256;
    _schema[2] = SchemaType.UINT256;
    _schema[3] = SchemaType.UINT256;
    _schema[4] = SchemaType.STRING;
    _schema[5] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](6);
    _fieldNames[0] = "citizen";
    _fieldNames[1] = "proposalTime";
    _fieldNames[2] = "upvotes";
    _fieldNames[3] = "downvotes";
    _fieldNames[4] = "city";
    _fieldNames[5] = "country";
    return ("Proposal", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get citizen */
  function getCitizen(uint256 proposalId) internal view returns (address citizen) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get citizen (using the specified store) */
  function getCitizen(IStore _store, uint256 proposalId) internal view returns (address citizen) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set citizen */
  function setCitizen(uint256 proposalId, address citizen) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((citizen)));
  }

  /** Set citizen (using the specified store) */
  function setCitizen(IStore _store, uint256 proposalId, address citizen) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((citizen)));
  }

  /** Get proposalTime */
  function getProposalTime(uint256 proposalId) internal view returns (uint256 proposalTime) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get proposalTime (using the specified store) */
  function getProposalTime(IStore _store, uint256 proposalId) internal view returns (uint256 proposalTime) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set proposalTime */
  function setProposalTime(uint256 proposalId, uint256 proposalTime) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((proposalTime)));
  }

  /** Set proposalTime (using the specified store) */
  function setProposalTime(IStore _store, uint256 proposalId, uint256 proposalTime) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((proposalTime)));
  }

  /** Get upvotes */
  function getUpvotes(uint256 proposalId) internal view returns (uint256 upvotes) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get upvotes (using the specified store) */
  function getUpvotes(IStore _store, uint256 proposalId) internal view returns (uint256 upvotes) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set upvotes */
  function setUpvotes(uint256 proposalId, uint256 upvotes) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((upvotes)));
  }

  /** Set upvotes (using the specified store) */
  function setUpvotes(IStore _store, uint256 proposalId, uint256 upvotes) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((upvotes)));
  }

  /** Get downvotes */
  function getDownvotes(uint256 proposalId) internal view returns (uint256 downvotes) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get downvotes (using the specified store) */
  function getDownvotes(IStore _store, uint256 proposalId) internal view returns (uint256 downvotes) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set downvotes */
  function setDownvotes(uint256 proposalId, uint256 downvotes) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((downvotes)));
  }

  /** Set downvotes (using the specified store) */
  function setDownvotes(IStore _store, uint256 proposalId, uint256 downvotes) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((downvotes)));
  }

  /** Get city */
  function getCity(uint256 proposalId) internal view returns (string memory city) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (string(_blob));
  }

  /** Get city (using the specified store) */
  function getCity(IStore _store, uint256 proposalId) internal view returns (string memory city) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (string(_blob));
  }

  /** Set city */
  function setCity(uint256 proposalId, string memory city) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setField(_tableId, _keyTuple, 4, bytes((city)));
  }

  /** Set city (using the specified store) */
  function setCity(IStore _store, uint256 proposalId, string memory city) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setField(_tableId, _keyTuple, 4, bytes((city)));
  }

  /** Get the length of city */
  function lengthCity(uint256 proposalId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of city (using the specified store) */
  function lengthCity(IStore _store, uint256 proposalId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 4, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of city (unchecked, returns invalid data if index overflows) */
  function getItemCity(uint256 proposalId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of city (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemCity(IStore _store, uint256 proposalId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 4, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to city */
  function pushCity(uint256 proposalId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.pushToField(_tableId, _keyTuple, 4, bytes((_slice)));
  }

  /** Push a slice to city (using the specified store) */
  function pushCity(IStore _store, uint256 proposalId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.pushToField(_tableId, _keyTuple, 4, bytes((_slice)));
  }

  /** Pop a slice from city */
  function popCity(uint256 proposalId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.popFromField(_tableId, _keyTuple, 4, 1);
  }

  /** Pop a slice from city (using the specified store) */
  function popCity(IStore _store, uint256 proposalId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.popFromField(_tableId, _keyTuple, 4, 1);
  }

  /** Update a slice of city at `_index` */
  function updateCity(uint256 proposalId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)));
  }

  /** Update a slice of city (using the specified store) at `_index` */
  function updateCity(IStore _store, uint256 proposalId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.updateInField(_tableId, _keyTuple, 4, _index * 1, bytes((_slice)));
  }

  /** Get country */
  function getCountry(uint256 proposalId) internal view returns (string memory country) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5);
    return (string(_blob));
  }

  /** Get country (using the specified store) */
  function getCountry(IStore _store, uint256 proposalId) internal view returns (string memory country) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5);
    return (string(_blob));
  }

  /** Set country */
  function setCountry(uint256 proposalId, string memory country) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setField(_tableId, _keyTuple, 5, bytes((country)));
  }

  /** Set country (using the specified store) */
  function setCountry(IStore _store, uint256 proposalId, string memory country) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setField(_tableId, _keyTuple, 5, bytes((country)));
  }

  /** Get the length of country */
  function lengthCountry(uint256 proposalId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 5, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of country (using the specified store) */
  function lengthCountry(IStore _store, uint256 proposalId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 5, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of country (unchecked, returns invalid data if index overflows) */
  function getItemCountry(uint256 proposalId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 5, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of country (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemCountry(IStore _store, uint256 proposalId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 5, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to country */
  function pushCountry(uint256 proposalId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.pushToField(_tableId, _keyTuple, 5, bytes((_slice)));
  }

  /** Push a slice to country (using the specified store) */
  function pushCountry(IStore _store, uint256 proposalId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.pushToField(_tableId, _keyTuple, 5, bytes((_slice)));
  }

  /** Pop a slice from country */
  function popCountry(uint256 proposalId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.popFromField(_tableId, _keyTuple, 5, 1);
  }

  /** Pop a slice from country (using the specified store) */
  function popCountry(IStore _store, uint256 proposalId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.popFromField(_tableId, _keyTuple, 5, 1);
  }

  /** Update a slice of country at `_index` */
  function updateCountry(uint256 proposalId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.updateInField(_tableId, _keyTuple, 5, _index * 1, bytes((_slice)));
  }

  /** Update a slice of country (using the specified store) at `_index` */
  function updateCountry(IStore _store, uint256 proposalId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.updateInField(_tableId, _keyTuple, 5, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(uint256 proposalId) internal view returns (ProposalData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, uint256 proposalId) internal view returns (ProposalData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    uint256 proposalId,
    address citizen,
    uint256 proposalTime,
    uint256 upvotes,
    uint256 downvotes,
    string memory city,
    string memory country
  ) internal {
    bytes memory _data = encode(citizen, proposalTime, upvotes, downvotes, city, country);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    uint256 proposalId,
    address citizen,
    uint256 proposalTime,
    uint256 upvotes,
    uint256 downvotes,
    string memory city,
    string memory country
  ) internal {
    bytes memory _data = encode(citizen, proposalTime, upvotes, downvotes, city, country);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(uint256 proposalId, ProposalData memory _table) internal {
    set(proposalId, _table.citizen, _table.proposalTime, _table.upvotes, _table.downvotes, _table.city, _table.country);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, uint256 proposalId, ProposalData memory _table) internal {
    set(
      _store,
      proposalId,
      _table.citizen,
      _table.proposalTime,
      _table.upvotes,
      _table.downvotes,
      _table.city,
      _table.country
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (ProposalData memory _table) {
    // 116 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 116));

    _table.citizen = (address(Bytes.slice20(_blob, 0)));

    _table.proposalTime = (uint256(Bytes.slice32(_blob, 20)));

    _table.upvotes = (uint256(Bytes.slice32(_blob, 52)));

    _table.downvotes = (uint256(Bytes.slice32(_blob, 84)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 116) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 148;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.city = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.country = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    address citizen,
    uint256 proposalTime,
    uint256 upvotes,
    uint256 downvotes,
    string memory city,
    string memory country
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](2);
    _counters[0] = uint40(bytes(city).length);
    _counters[1] = uint40(bytes(country).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return
      abi.encodePacked(
        citizen,
        proposalTime,
        upvotes,
        downvotes,
        _encodedLengths.unwrap(),
        bytes((city)),
        bytes((country))
      );
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(uint256 proposalId) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));
  }

  /* Delete all data for given keys */
  function deleteRecord(uint256 proposalId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, uint256 proposalId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((proposalId)));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
