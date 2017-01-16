import Foundation

public extension String {
    public var length: Int {
        return self.characters.count
    }

    public var paddedForBase64: String {
        guard let stringData = self.data(using: .utf8) else { return self }

        var buffer = Data()

        var i = 0
        while let subData = stringData.subdata(in: i..<(i + 3)) as? Data {
            i += 3

        let group24 = (subData[0], subData[1], subData[2])
        print(group24)

        }

//        while (buffer = file.read(3)) != nil do // read up to 3 bytes at a time
//        pad = '' // padding for this group of 4 characters
//        while buffer.length < 3
//        buf << "\0"
//        pad << '='
//        end
//        group24 = (buf[0] << 16) | (buf[1] << 8) | buf[2] // current 3 bytes as a 24 bit value
//        encoded = BASE64_CHARS[(group24 >> 18) & 0x3f, 1] // read the 24 bit value 6 bits at a time
//        encoded << BASE64_CHARS[(group24 >> 12) & 0x3f, 1]
//        encoded << BASE64_CHARS[(group24 >> 6) & 0x3f, 1]
//        encoded << BASE64_CHARS[(group24 >> 0) & 0x3f, 1]
//        encoded[4 - pad.length, pad.length] = pad // add the padding

        return ""
    }
}
