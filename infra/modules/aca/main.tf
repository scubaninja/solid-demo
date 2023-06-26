
data "bigip_ltm_datagroup" "DG-TC3" {
  name = "test-dg"
  partition = "Common"
}
