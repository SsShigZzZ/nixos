{
  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;
}
