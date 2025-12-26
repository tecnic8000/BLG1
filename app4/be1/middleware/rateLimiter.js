import ratelimit from "../config/upstash.js";

export async function rateLimiter(req, res, next) {
     try {
          // per user --> john cena
          const { success } = await ratelimit.limit("my-limit-key1") // userId: johnCena
          if (!success) return res.status(429).json({ message: " rate limit hit!" })
          next()
     } catch (e) {
          console.log("Rate limit ERR", e)
          next()
     }
}