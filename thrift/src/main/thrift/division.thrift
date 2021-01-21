namespace java io.nullable.api.sample.thrift

typedef i32 int

service DivisionService {
  int divide(1:int n1, 2:int n2)
}
