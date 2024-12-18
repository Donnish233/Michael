// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./MyFirstContract.sol";
contract LearningHub is MyFirstContract {
    // Define a set of badges using Enum
    enum Badge { None, Beginner, Intermediate, Advanced }

    // Define a struct for a Student
    struct Student {
        string name;
        uint8 age; // Packed with 'Badge' to save storage
        Badge badge; // Enum type
        uint256 coursesCompleted;
    }

    // Mapping from address to student details
    mapping(address => Student) public students;

    // Address of the contract owner
    address public owner;

    // Events for transparency and logging
    event Enrolled(address indexed student, string name);
    event CourseCompleted(address indexed student, uint256 coursesCompleted, Badge badge);
    event FundsDeposited(address indexed depositor, uint256 amount);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    /**
     * @dev Constructor to set the owner
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Enroll a student in the system
     * @param _name The name of the student
     * @param _age The age of the student
     */
    function enroll(string memory _name, uint8 _age) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(_age > 0, "Age must be greater than 0");

        students[msg.sender] = Student({
            name: _name,
            age: _age,
            badge: Badge.None,
            coursesCompleted: 0
        });

        emit Enrolled(msg.sender, _name);
    }

    /**
     * @dev Mark a course as completed for the student
     */
    function completeCourse() public {
        Student storage student = students[msg.sender];
        require(bytes(student.name).length > 0, "Student not enrolled");

        student.coursesCompleted += 1;

        // Assign badges based on courses completed
        if (student.coursesCompleted >= 10) {
            student.badge = Badge.Advanced;
        } else if (student.coursesCompleted >= 5) {
            student.badge = Badge.Intermediate;
        } else if (student.coursesCompleted >= 1) {
            student.badge = Badge.Beginner;
        }

        emit CourseCompleted(msg.sender, student.coursesCompleted, student.badge);
    }

    /**
     * @dev Get student details
     * @param _student Address of the student
     */
    function getStudentDetails(address _student) public view returns (string memory, uint8, Badge, uint256) {
        Student storage student = students[_student];
        return (student.name, student.age, student.badge, student.coursesCompleted);
    }

    /**
     * @dev Deposit funds into the contract
     */
    function FundDapp() public payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        emit FundsDeposited(msg.sender, msg.value);
    }

    /**
     * @dev Withdraw funds from the contract (only owner can withdraw)
     * @param _amount The amount to withdraw
     */
    function withdrawFunding(uint256 _amount) public onlyOwner {
        require(_amount <= address(this).balance, "Insufficient balance");
        payable(owner).transfer(_amount);
        emit FundsWithdrawn(owner, _amount);
    }
}