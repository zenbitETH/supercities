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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Citizen")));
bytes32 constant CitizenTableId = _tableId;

struct CitizenData {
  string name;
  uint256 verifiedCities;
  string roleAttestation;
  uint256 level;
  uint256 gamePoints;
  uint256 cityCommittedTo;
}

library Citizen {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](6);
    _schema[0] = SchemaType.STRING;
    _schema[1] = SchemaType.UINT256;
    _schema[2] = SchemaType.STRING;
    _schema[3] = SchemaType.UINT256;
    _schema[4] = SchemaType.UINT256;
    _schema[5] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](6);
    _fieldNames[0] = "name";
    _fieldNames[1] = "verifiedCities";
    _fieldNames[2] = "roleAttestation";
    _fieldNames[3] = "level";
    _fieldNames[4] = "gamePoints";
    _fieldNames[5] = "cityCommittedTo";
    return ("Citizen", _fieldNames);
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

  /** Get name */
  function getName(address citizenId) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /** Get name (using the specified store) */
  function getName(IStore _store, address citizenId) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /** Set name */
  function setName(address citizenId, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setField(_tableId, _keyTuple, 0, bytes((name)));
  }

  /** Set name (using the specified store) */
  function setName(IStore _store, address citizenId, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setField(_tableId, _keyTuple, 0, bytes((name)));
  }

  /** Get the length of name */
  function lengthName(address citizenId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of name (using the specified store) */
  function lengthName(IStore _store, address citizenId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of name (unchecked, returns invalid data if index overflows) */
  function getItemName(address citizenId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of name (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemName(IStore _store, address citizenId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to name */
  function pushName(address citizenId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /** Push a slice to name (using the specified store) */
  function pushName(IStore _store, address citizenId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.pushToField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /** Pop a slice from name */
  function popName(address citizenId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 1);
  }

  /** Pop a slice from name (using the specified store) */
  function popName(IStore _store, address citizenId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.popFromField(_tableId, _keyTuple, 0, 1);
  }

  /** Update a slice of name at `_index` */
  function updateName(address citizenId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 1, bytes((_slice)));
  }

  /** Update a slice of name (using the specified store) at `_index` */
  function updateName(IStore _store, address citizenId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.updateInField(_tableId, _keyTuple, 0, _index * 1, bytes((_slice)));
  }

  /** Get verifiedCities */
  function getVerifiedCities(address citizenId) internal view returns (uint256 verifiedCities) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get verifiedCities (using the specified store) */
  function getVerifiedCities(IStore _store, address citizenId) internal view returns (uint256 verifiedCities) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set verifiedCities */
  function setVerifiedCities(address citizenId, uint256 verifiedCities) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((verifiedCities)));
  }

  /** Set verifiedCities (using the specified store) */
  function setVerifiedCities(IStore _store, address citizenId, uint256 verifiedCities) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((verifiedCities)));
  }

  /** Get roleAttestation */
  function getRoleAttestation(address citizenId) internal view returns (string memory roleAttestation) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (string(_blob));
  }

  /** Get roleAttestation (using the specified store) */
  function getRoleAttestation(IStore _store, address citizenId) internal view returns (string memory roleAttestation) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (string(_blob));
  }

  /** Set roleAttestation */
  function setRoleAttestation(address citizenId, string memory roleAttestation) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setField(_tableId, _keyTuple, 2, bytes((roleAttestation)));
  }

  /** Set roleAttestation (using the specified store) */
  function setRoleAttestation(IStore _store, address citizenId, string memory roleAttestation) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setField(_tableId, _keyTuple, 2, bytes((roleAttestation)));
  }

  /** Get the length of roleAttestation */
  function lengthRoleAttestation(address citizenId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of roleAttestation (using the specified store) */
  function lengthRoleAttestation(IStore _store, address citizenId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of roleAttestation (unchecked, returns invalid data if index overflows) */
  function getItemRoleAttestation(address citizenId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of roleAttestation (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemRoleAttestation(
    IStore _store,
    address citizenId,
    uint256 _index
  ) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to roleAttestation */
  function pushRoleAttestation(address citizenId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /** Push a slice to roleAttestation (using the specified store) */
  function pushRoleAttestation(IStore _store, address citizenId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.pushToField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /** Pop a slice from roleAttestation */
  function popRoleAttestation(address citizenId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 1);
  }

  /** Pop a slice from roleAttestation (using the specified store) */
  function popRoleAttestation(IStore _store, address citizenId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.popFromField(_tableId, _keyTuple, 2, 1);
  }

  /** Update a slice of roleAttestation at `_index` */
  function updateRoleAttestation(address citizenId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)));
  }

  /** Update a slice of roleAttestation (using the specified store) at `_index` */
  function updateRoleAttestation(IStore _store, address citizenId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)));
  }

  /** Get level */
  function getLevel(address citizenId) internal view returns (uint256 level) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get level (using the specified store) */
  function getLevel(IStore _store, address citizenId) internal view returns (uint256 level) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set level */
  function setLevel(address citizenId, uint256 level) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((level)));
  }

  /** Set level (using the specified store) */
  function setLevel(IStore _store, address citizenId, uint256 level) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((level)));
  }

  /** Get gamePoints */
  function getGamePoints(address citizenId) internal view returns (uint256 gamePoints) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get gamePoints (using the specified store) */
  function getGamePoints(IStore _store, address citizenId) internal view returns (uint256 gamePoints) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set gamePoints */
  function setGamePoints(address citizenId, uint256 gamePoints) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setField(_tableId, _keyTuple, 4, abi.encodePacked((gamePoints)));
  }

  /** Set gamePoints (using the specified store) */
  function setGamePoints(IStore _store, address citizenId, uint256 gamePoints) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setField(_tableId, _keyTuple, 4, abi.encodePacked((gamePoints)));
  }

  /** Get cityCommittedTo */
  function getCityCommittedTo(address citizenId) internal view returns (uint256 cityCommittedTo) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get cityCommittedTo (using the specified store) */
  function getCityCommittedTo(IStore _store, address citizenId) internal view returns (uint256 cityCommittedTo) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set cityCommittedTo */
  function setCityCommittedTo(address citizenId, uint256 cityCommittedTo) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setField(_tableId, _keyTuple, 5, abi.encodePacked((cityCommittedTo)));
  }

  /** Set cityCommittedTo (using the specified store) */
  function setCityCommittedTo(IStore _store, address citizenId, uint256 cityCommittedTo) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setField(_tableId, _keyTuple, 5, abi.encodePacked((cityCommittedTo)));
  }

  /** Get the full data */
  function get(address citizenId) internal view returns (CitizenData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, address citizenId) internal view returns (CitizenData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    address citizenId,
    string memory name,
    uint256 verifiedCities,
    string memory roleAttestation,
    uint256 level,
    uint256 gamePoints,
    uint256 cityCommittedTo
  ) internal {
    bytes memory _data = encode(name, verifiedCities, roleAttestation, level, gamePoints, cityCommittedTo);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    address citizenId,
    string memory name,
    uint256 verifiedCities,
    string memory roleAttestation,
    uint256 level,
    uint256 gamePoints,
    uint256 cityCommittedTo
  ) internal {
    bytes memory _data = encode(name, verifiedCities, roleAttestation, level, gamePoints, cityCommittedTo);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(address citizenId, CitizenData memory _table) internal {
    set(
      citizenId,
      _table.name,
      _table.verifiedCities,
      _table.roleAttestation,
      _table.level,
      _table.gamePoints,
      _table.cityCommittedTo
    );
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, address citizenId, CitizenData memory _table) internal {
    set(
      _store,
      citizenId,
      _table.name,
      _table.verifiedCities,
      _table.roleAttestation,
      _table.level,
      _table.gamePoints,
      _table.cityCommittedTo
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (CitizenData memory _table) {
    // 128 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 128));

    _table.verifiedCities = (uint256(Bytes.slice32(_blob, 0)));

    _table.level = (uint256(Bytes.slice32(_blob, 32)));

    _table.gamePoints = (uint256(Bytes.slice32(_blob, 64)));

    _table.cityCommittedTo = (uint256(Bytes.slice32(_blob, 96)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 128) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 160;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.name = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.roleAttestation = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    string memory name,
    uint256 verifiedCities,
    string memory roleAttestation,
    uint256 level,
    uint256 gamePoints,
    uint256 cityCommittedTo
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](2);
    _counters[0] = uint40(bytes(name).length);
    _counters[1] = uint40(bytes(roleAttestation).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return
      abi.encodePacked(
        verifiedCities,
        level,
        gamePoints,
        cityCommittedTo,
        _encodedLengths.unwrap(),
        bytes((name)),
        bytes((roleAttestation))
      );
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(address citizenId) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));
  }

  /* Delete all data for given keys */
  function deleteRecord(address citizenId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address citizenId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((citizenId))));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
