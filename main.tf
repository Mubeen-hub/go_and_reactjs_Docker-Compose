resource "aws_key_pair" "SamNew" {
   key_name   = "SamNew-key"
   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxMs4eiEi4abNSrpOJBbtCVDycR5lXgMNVFbv5mR3BtPYS7RRblYdcfEH/nh68jP8jor0VTDx+6uDvzGl+saTJF7CbONijgps8yx8tIL3arrQ9PB7def4MFDatJDeQwCXcatbD8mkld20zCgNsFmDvweF53EA4tHMF9oT7dZMUNthtTS0ZzgmuYvKn6Cnvc9rbyUMB/QjSP0E66iysrbDdrdcVCFSaXH/l8qo7Yn9TAoWn3C/j1XsoBuudQBLUYXsov4elCSCa61FVkEik1fa4lXNP3uxYSXOt0TB5OoZyrLx0EY1ocqK6g9cqcrHEnPdZQuMXF19DcydvAomC2uqA6oI07r/QmcDjTfoFiXNp1mz+kRWRbs0ZqK0UOcuh5dMB+WvW2mjeAbkHxDX2ZaAM7O0qR3FdZQW/yKGDKGOpVoExgy0iyuNfRD+pqWE2s0qOcH8ePgu5W63zqCRy2KxVFa56LhcPQkt9Jxpxwny5dBfyyh4P4iOy57syYJnCDDjdkYwLXejzhF1nZH9RGQQuMWeO0mQR1uxABhT5IibHWyxOPHMvM1dOpgAg77a3XenO0v7zryivPLyuy5WpFyRzZbEnmbkCumqInBu/Min4HknbVZexEA/ltJJQMs4QF12AopgYRjr/IF64kNlItMbYnuyYQIcR/Bl2Zy51fJc98Q== shamir@Shamir-Notebook"

}


resource "aws_instance" "Masters" {
  count = 1
  ami = "ami-00a208c7cdba991ea"
  instance_type = "t2.medium"

    associate_public_ip_address=true
    key_name = "SamNew-key"

  vpc_security_group_ids=["default"]
  tags={
  Name = "master0${count.index}"
}
}


resource "aws_instance" "Workers" {
  count = 2
  ami = "ami-00a208c7cdba991ea"
  instance_type = "t2.nano"

    associate_public_ip_address=true
    key_name = "SamNew-key"


  vpc_security_group_ids=["default"]


  tags={
  Name = "Worker0${count.index}"

}
}






