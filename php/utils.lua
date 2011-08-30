module("php.utils", package.seeall)

local ffi = require "ffi"

ffi.cdef[[
    struct in_addr {
        uint32_t s_addr;
    };

    int inet_aton(const char *cp, struct in_addr *inp);
    uint32_t ntohl(uint32_t netlong);

    char *inet_ntoa(struct in_addr in);
    uint32_t htonl(uint32_t hostlong);
]]

function ip2long(ip)
    local inp = ffi.new("struct in_addr[1]")
    if ffi.C.inet_aton(ip, inp) ~= 0 then
        return ffi.C.ntohl(inp[0].s_addr)
    end
    return nil
end

-- print(ip2long("10.32.125.43"))
-- print(ip2long("1.10.32.125.43"))

function long2ip(long)
    if type(long) ~= "number" then
        return nil
    end
    local addr = ffi.new("struct in_addr")
    addr.s_addr = ffi.C.htonl(long)
    return ffi.string(ffi.C.inet_ntoa(addr))
end

