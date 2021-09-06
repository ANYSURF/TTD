pragma ton-solidity >= 0.35.0;

contract ZombieFactory {

    // Здесь объяви событие

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        // Здесь запусти событие
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(sha256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
